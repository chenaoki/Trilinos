// @HEADER
// ***********************************************************************
//
//                           Stokhos Package
//                 Copyright (2009) Sandia Corporation
//
// Under terms of Contract DE-AC04-94AL85000, there is a non-exclusive
// license for use of this work by or on behalf of the U.S. Government.
//
// This library is free software; you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as
// published by the Free Software Foundation; either version 2.1 of the
// License, or (at your option) any later version.
//
// This library is distributed in the hope that it will be useful, but
// WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public
// License along with this library; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
// USA
// Questions? Eric T. Phipps (etphipp@sandia.gov).
//
// ***********************************************************************
// @HEADER

#ifndef STOKHOS_LTB_SPARSE_3_TENSOR_HPP
#define STOKHOS_LTB_SPARSE_3_TENSOR_HPP

#include <ostream>

#include "Stokhos_TotalOrderBasis.hpp"
#include "Stokhos_OrthogPolyApprox.hpp"

namespace Stokhos {

  /*!
   * \brief Data structure storing a sparse 3-tensor C(i,j,k) in a
   * a tree-based format for lexicographically ordered product bases.
   */
  template <typename ordinal_type, typename value_type>
  class LTBSparse3Tensor {
  public:

    //! Node type used in constructing the tree
    struct CijkNode {
      Teuchos::Array< Teuchos::RCP<CijkNode> > children;
      Teuchos::Array<value_type> values;
      ordinal_type p_i, p_j, p_k;
      ordinal_type i_begin, j_begin, k_begin;
      ordinal_type i_size, j_size, k_size;
      ordinal_type my_num_entries, total_num_entries;
      ordinal_type total_num_leafs;
      bool is_leaf;
    };

    //! Constructor
    LTBSparse3Tensor() {}

    //! Destructor
    ~LTBSparse3Tensor() {}

    //! Set the head node
    void setHeadNode(const Teuchos::RCP<CijkNode>& h) { head = h; }

    //! Get the head node
    Teuchos::RCP<const CijkNode> getHeadNode() const { return head; }

    //! Print tensor
    void print(std::ostream& os) const {}

    //! Get Cijk value for a given i, j, k indices
    value_type getValue(ordinal_type i, ordinal_type j, ordinal_type k) const
      {}

    //! Return number of non-zero entries
    ordinal_type num_entries() const {
      if (head != Teuchos::null)
        return head->total_num_entries;
      return 0;
    }

    //! Return number of nodes
    ordinal_type num_leafs() const {
      if (head != Teuchos::null)
        return head->total_num_leafs;
      return 0;
    }

  private:

    // Prohibit copying
    LTBSparse3Tensor(const LTBSparse3Tensor&);

    // Prohibit Assignment
    LTBSparse3Tensor& operator=(const LTBSparse3Tensor& b);

  protected:

    Teuchos::RCP<CijkNode> head;

  }; // class LTBSparse3Tensor

  /*! \relates LTBSparse3Tensor
   * Print triple product tensor to output stream
   */
  template <typename ordinal_type, typename value_type>
  std::ostream&
  operator << (std::ostream& os,
               const LTBSparse3Tensor<ordinal_type, value_type>& Cijk) {
    Cijk.print(os);
    return os;
  }

  template <typename ordinal_type>
  struct LexicographicTreeBasisNode {
    Teuchos::Array< Teuchos::RCP<LexicographicTreeBasisNode> > children;
    Teuchos::Array< Stokhos::MultiIndex<ordinal_type> > terms;
    ordinal_type index_begin;
    ordinal_type block_size;

    // Default constructor
    LexicographicTreeBasisNode() :
      children(), terms(), index_begin(0), block_size(0) {}

    // Copy constructor
    LexicographicTreeBasisNode(const LexicographicTreeBasisNode& node) :
      children(node.children.size()), terms(node.terms),
      index_begin(node.index_begin), block_size(node.block_size) {
      for (ordinal_type i=0; i<children.size(); ++i)
        children[i] =
          Teuchos::rcp(new LexicographicTreeBasisNode(*(node->children[i])));
    }

    // Assignment operator
    LexicographicTreeBasisNode&
    operator=(const LexicographicTreeBasisNode& node) {
      if (this != &node) {
        children.resize(node.children.size());
        for (ordinal_type i=0; i<children.size(); ++i)
          children[i] =
            Teuchos::rcp(new LexicographicTreeBasisNode(*(node->children[i])));
        terms = node.terms;
        index_begin = node.index_begin;
        block_size = node.block_size;
      }
      return *this;
    }
  };

  template <typename ordinal_type>
  Teuchos::RCP< LexicographicTreeBasisNode<ordinal_type> >
  build_lexicographic_basis_tree(
    const Teuchos::ArrayView<const ordinal_type>& basis_orders,
    const ordinal_type total_order,
    const ordinal_type index_begin = ordinal_type(0),
    const ordinal_type order_sum = ordinal_type(0),
    const Stokhos::MultiIndex<ordinal_type>& term_prefix =
    Stokhos::MultiIndex<ordinal_type>()) {

    typedef LexicographicTreeBasisNode<ordinal_type> node_type;

    ordinal_type my_d = basis_orders.size();
    ordinal_type prev_d = term_prefix.dimension();
    ordinal_type p = basis_orders[0];
    ordinal_type my_p = std::min(total_order-order_sum, p);

    Teuchos::RCP<node_type> node = Teuchos::rcp(new node_type);
    node->index_begin = index_begin;
    node->terms.resize(my_p+1);
    for (ordinal_type i=0; i<=my_p; ++i) {
      node->terms[i].resize(prev_d+1);
      for (ordinal_type j=0; j<prev_d; ++j)
        node->terms[i][j] = term_prefix[j];
      node->terms[i][prev_d] = i;
    }

    // Base case for dimension = 1
    if (my_d == 1) {
      node->block_size = my_p+1;
    }

    // General case -- call recursively stripping off first dimension
    else {
      Teuchos::ArrayView<const ordinal_type> bo =
        Teuchos::arrayView(&basis_orders[1],my_d-1);
      node->children.resize(my_p+1);
      node->index_begin = index_begin;
      node->block_size = 0;
      for (ordinal_type i=0; i<=my_p; ++i) {
        Teuchos::RCP<node_type> child = build_lexicographic_basis_tree(
          bo, total_order, index_begin+node->block_size, order_sum+i,
          node->terms[i]);
        node->children[i] = child;
        node->block_size += child->block_size;
      }
    }

    return node;
  }

  // An approach for building a sparse 3-tensor only for lexicographically
  // ordered total order basis using a tree-based format
  template <typename ordinal_type,
            typename value_type>
  Teuchos::RCP< LTBSparse3Tensor<ordinal_type, value_type> >
  computeTripleProductTensorLTB(
    const TotalOrderBasis<ordinal_type, value_type,LexographicLess<MultiIndex<ordinal_type> > >& product_basis,
    bool symmetric = false) {
#ifdef STOKHOS_TEUCHOS_TIME_MONITOR
    TEUCHOS_FUNC_TIME_MONITOR("Stokhos: Total Triple-Product Tensor Time");
#endif
    using Teuchos::RCP;
    using Teuchos::rcp;
    using Teuchos::Array;
    using Teuchos::ArrayView;

    typedef MultiIndex<ordinal_type> coeff_type;
    const Array< RCP<const OneDOrthogPolyBasis<ordinal_type, value_type> > >& bases = product_basis.getCoordinateBases();
    ordinal_type d = bases.size();
    ordinal_type p = product_basis.order();
    Array<ordinal_type> basis_orders(d);
    for (int i=0; i<d; ++i)
      basis_orders[i] = bases[i]->order();
    ArrayView<const ordinal_type> basis_orders_view = basis_orders();

    // Create 1-D triple products
    Array< RCP<Sparse3Tensor<ordinal_type,value_type> > > Cijk_1d(d);
    for (ordinal_type i=0; i<d; i++) {
      Cijk_1d[i] =
        bases[i]->computeSparseTripleProductTensor(bases[i]->order()+1);
    }
    ArrayView<const RCP<Sparse3Tensor<ordinal_type,value_type> > > Cijk_1d_view
      = Cijk_1d();

    // Create lexicographic tree basis
    Teuchos::RCP< LexicographicTreeBasisNode<ordinal_type> > ltb =
      build_lexicographic_basis_tree(basis_orders_view, p);

    // Current implementation is recursive on the dimension d
    typedef LTBSparse3Tensor<ordinal_type, value_type> Cijk_type;
    RCP<Cijk_type> Cijk = rcp(new Cijk_type);
    RCP<typename Cijk_type::CijkNode> head =
      computeCijkLTBNode(
        basis_orders_view, Cijk_1d_view, ltb, ltb, ltb, p, symmetric);
    Cijk->setHeadNode(head);

    return Cijk;
  }

  template <typename ordinal_type,
            typename value_type>
  Teuchos::RCP<typename LTBSparse3Tensor<ordinal_type, value_type>::CijkNode>
  computeCijkLTBNode(
    const Teuchos::ArrayView<const ordinal_type>& basis_orders,
    const Teuchos::ArrayView<const Teuchos::RCP<Sparse3Tensor<ordinal_type,value_type> > >& Cijk_1d,
    const Teuchos::RCP<LexicographicTreeBasisNode<ordinal_type> >& i_ltb,
    const Teuchos::RCP<LexicographicTreeBasisNode<ordinal_type> >& j_ltb,
    const Teuchos::RCP<LexicographicTreeBasisNode<ordinal_type> >& k_ltb,
    const ordinal_type total_order,
    const bool symmetric,
    const ordinal_type sum_i = ordinal_type(0),
    const ordinal_type sum_j = ordinal_type(0),
    const ordinal_type sum_k = ordinal_type(0),
    const value_type cijk_base = value_type(1)) {

    using Teuchos::RCP;
    using Teuchos::rcp;
    using Teuchos::ArrayView;
    using Teuchos::arrayView;
    typedef typename LTBSparse3Tensor<ordinal_type, value_type>::CijkNode node_type;
    typedef ProductBasisUtils::Cijk_1D_Iterator<ordinal_type> Cijk_Iterator;

    ordinal_type my_d = basis_orders.size();
    ordinal_type p = basis_orders[0];
    ordinal_type p_i = std::min(total_order-sum_i, p);
    ordinal_type p_j = std::min(total_order-sum_j, p);
    ordinal_type p_k = std::min(total_order-sum_k, p);
    Cijk_Iterator cijk_iterator(p_i, p_j, p_k, symmetric);

    RCP<node_type> node = rcp(new node_type);
    node->p_i = p_i;
    node->p_j = p_j;
    node->p_k = p_k;
    node->i_begin = i_ltb->index_begin;
    node->j_begin = j_ltb->index_begin;
    node->k_begin = k_ltb->index_begin;
    node->i_size = i_ltb->block_size;
    node->j_size = j_ltb->block_size;
    node->k_size = k_ltb->block_size;

    // Base case -- compute the actual cijk values
    if (my_d == 1) {
      node->is_leaf = true;
      bool more = true;
      while (more) {
        value_type cijk =
          Cijk_1d[0]->getValue(cijk_iterator.i,
                               cijk_iterator.j,
                               cijk_iterator.k);
        node->values.push_back(cijk*cijk_base);
        more = cijk_iterator.increment();
      }
      node->my_num_entries = node->values.size();
      node->total_num_entries = node->values.size();
      node->total_num_leafs = 1;
    }

    // General case -- call recursively stripping off first dimension
    else {
      node->is_leaf = false;
      ArrayView<const ordinal_type> bo = arrayView(&basis_orders[1], my_d-1);
      ArrayView<const RCP<Sparse3Tensor<ordinal_type,value_type> > > c1d =
        arrayView(&Cijk_1d[1], my_d-1);
      node->total_num_entries = 0;
      node->total_num_leafs = 0;
      bool more = true;
      while (more) {
        value_type cijk =
          Cijk_1d[0]->getValue(cijk_iterator.i,
                               cijk_iterator.j,
                               cijk_iterator.k);
        RCP<node_type> child =
          computeCijkLTBNode(bo, c1d,
                             i_ltb->children[cijk_iterator.i],
                             j_ltb->children[cijk_iterator.j],
                             k_ltb->children[cijk_iterator.k],
                             total_order, symmetric,
                             sum_i + cijk_iterator.i,
                             sum_j + cijk_iterator.j,
                             sum_k + cijk_iterator.k,
                             cijk_base*cijk);
        node->children.push_back(child);
        node->total_num_entries += child->total_num_entries;
        node->total_num_leafs += child->total_num_leafs;
        more = cijk_iterator.increment();
      }
      node->my_num_entries = node->children.size();
    }

    return node;
  }

  // An approach for building a sparse 3-tensor only for lexicographically
  // ordered total order basis using a tree-based format -- the leaf nodes
  // are replaced by a dense p_i x p_j x p_k block
  template <typename ordinal_type,
            typename value_type>
  Teuchos::RCP< LTBSparse3Tensor<ordinal_type, value_type> >
  computeTripleProductTensorLTBBlockLeaf(
    const TotalOrderBasis<ordinal_type, value_type,LexographicLess<MultiIndex<ordinal_type> > >& product_basis,
    bool symmetric = false,
    const ordinal_type size_threshold = ordinal_type(0)) {
#ifdef STOKHOS_TEUCHOS_TIME_MONITOR
    TEUCHOS_FUNC_TIME_MONITOR("Stokhos: Total Triple-Product Tensor Time");
#endif
    using Teuchos::RCP;
    using Teuchos::rcp;
    using Teuchos::Array;
    using Teuchos::ArrayView;

    typedef MultiIndex<ordinal_type> coeff_type;
    const Array< RCP<const OneDOrthogPolyBasis<ordinal_type, value_type> > >& bases = product_basis.getCoordinateBases();
    ordinal_type d = bases.size();
    ordinal_type p = product_basis.order();
    Array<ordinal_type> basis_orders(d);
    for (int i=0; i<d; ++i)
      basis_orders[i] = bases[i]->order();
    ArrayView<const ordinal_type> basis_orders_view = basis_orders();

    // Create 1-D triple products
    Array< RCP<Dense3Tensor<ordinal_type,value_type> > > Cijk_1d(d);
    for (ordinal_type i=0; i<d; i++) {
      Cijk_1d[i] = bases[i]->computeTripleProductTensor();
    }
    ArrayView<const RCP<Dense3Tensor<ordinal_type,value_type> > > Cijk_1d_view
      = Cijk_1d();

    // Create lexicographic tree basis
    Teuchos::RCP< LexicographicTreeBasisNode<ordinal_type> > ltb =
      build_lexicographic_basis_tree(basis_orders_view, p);

    // Current implementation is recursive on the dimension d
    typedef LTBSparse3Tensor<ordinal_type, value_type> Cijk_type;
    RCP<Cijk_type> Cijk = rcp(new Cijk_type);
    RCP<typename Cijk_type::CijkNode> head =
      computeCijkLTBNodeBlockLeaf(
        basis_orders_view, Cijk_1d_view, ltb, ltb, ltb, p, symmetric,
        size_threshold);
    Cijk->setHeadNode(head);

    return Cijk;
  }

  template <typename ordinal_type,
            typename value_type>
  Teuchos::RCP<typename LTBSparse3Tensor<ordinal_type, value_type>::CijkNode>
  computeCijkLTBNodeBlockLeaf(
    const Teuchos::ArrayView<const ordinal_type>& basis_orders,
    const Teuchos::ArrayView<const Teuchos::RCP<Dense3Tensor<ordinal_type,value_type> > >& Cijk_1d,
    const Teuchos::RCP<LexicographicTreeBasisNode<ordinal_type> >& i_ltb,
    const Teuchos::RCP<LexicographicTreeBasisNode<ordinal_type> >& j_ltb,
    const Teuchos::RCP<LexicographicTreeBasisNode<ordinal_type> >& k_ltb,
    const ordinal_type total_order,
    const bool symmetric,
    const ordinal_type size_threshold,
    const ordinal_type sum_i = ordinal_type(0),
    const ordinal_type sum_j = ordinal_type(0),
    const ordinal_type sum_k = ordinal_type(0),
    const value_type cijk_base = value_type(1),
    const bool parent_is_below_threshold = false) {

    using Teuchos::RCP;
    using Teuchos::rcp;
    using Teuchos::ArrayView;
    using Teuchos::arrayView;
    typedef typename LTBSparse3Tensor<ordinal_type, value_type>::CijkNode node_type;
    typedef ProductBasisUtils::Cijk_1D_Iterator<ordinal_type> Cijk_Iterator;

    ordinal_type my_d = basis_orders.size();
    ordinal_type p = basis_orders[0];
    ordinal_type p_i = std::min(total_order-sum_i, p);
    ordinal_type p_j = std::min(total_order-sum_j, p);
    ordinal_type p_k = std::min(total_order-sum_k, p);

    RCP<node_type> node = rcp(new node_type);
    node->p_i = p_i;
    node->p_j = p_j;
    node->p_k = p_k;
    node->i_begin = i_ltb->index_begin;
    node->j_begin = j_ltb->index_begin;
    node->k_begin = k_ltb->index_begin;
    node->i_size = i_ltb->block_size;
    node->j_size = j_ltb->block_size;
    node->k_size = k_ltb->block_size;

    // Check if volume is below the threshold
    bool below_threshold = 
      node->i_size * node->j_size * node->k_size <= size_threshold;

    if (parent_is_below_threshold && !below_threshold)
      std::cout << "threshold error!" << std::endl;

    // Base case -- compute the actual cijk values as a "brick"
    // Could store values as a "pyramid" using commented out code below
    if (my_d == 1) {
      node->is_leaf = true;
      node->values.reserve((p_i+1)*(p_j+1)*(p_k+1));
      if (symmetric) {
        for (ordinal_type i=0; i<=p_i; ++i) {
          for (ordinal_type j=0; j<=p_j; ++j) {
            // const ordinal_type imj = i-j;
            // const ordinal_type ipj = i+j;
            // const ordinal_type k_beg = 0   <= imj ? imj : -imj;
            // const ordinal_type k_end = p_k <= ipj ? p_k :  ipj;
            // const ordinal_type k0 = k_beg % 2 == (i+j) % 2 ? k_beg : k_beg+1;
            const ordinal_type k0 = (i+j)%2;
            const ordinal_type k_end = p_k;
            for (ordinal_type k=k0; k<=k_end; k+=2) {
              value_type cijk = (*Cijk_1d[0])(i, j, k);
              node->values.push_back(cijk*cijk_base);
            }
          }
        }
      }
      else {
        for (ordinal_type i=0; i<=p_i; ++i) {
          for (ordinal_type j=0; j<=p_j; ++j) {
            for (ordinal_type k=0; k<=p_k; ++k) {
              value_type cijk = (*Cijk_1d[0])(i, j, k);
              node->values.push_back(cijk*cijk_base);
            }
          }
        }
      }
      node->my_num_entries = node->values.size();
      node->total_num_entries = node->values.size();
      node->total_num_leafs = 1;
    }

    // Once blocks get small enough, transition from "pyramid" to "brick"
    // collapsing all child nodes into this node
    // Could we collapse these into a (dense) pyramid?  Not sure if the above
    // formulas then hold.
    // This doesn't do as good of a job of preventing small blocks as I would 
    // like because we can only collapse children in an all-or-nothing.  Some
    // nodes very high up in the tree have small blocks to begin with.
    //
    // Note, this doesn't exactly seem to work for the symmetric case.  The
    // number of generated non-zeros doesn't seem to match the block size.
    else if (below_threshold) {
      node->is_leaf = true;
      ArrayView<const ordinal_type> bo = arrayView(&basis_orders[1], my_d-1);
      ArrayView<const RCP<Dense3Tensor<ordinal_type,value_type> > > c1d =
        arrayView(&Cijk_1d[1], my_d-1);
      for (ordinal_type i=0; i<=p_i; ++i) {
        for (ordinal_type j=0; j<=p_j; ++j) {
          if (symmetric) {
            for (ordinal_type k=(i+j)%2; k<=p_k; k+=2) {
              value_type cijk = (*Cijk_1d[0])(i, j, k);
              RCP<node_type> child =
                computeCijkLTBNodeBlockLeaf(bo, c1d,
                                            i_ltb->children[i],
                                            j_ltb->children[j],
                                            k_ltb->children[k],
                                            total_order, symmetric,
                                            size_threshold,
                                            sum_i + i,
                                            sum_j + j,
                                            sum_k + k,
                                            cijk_base*cijk,
                                            below_threshold);
              node->values.insert(node->values.end(),
                                  child->values.begin(),
                                  child->values.end());
            }
          }
          else {
            for (ordinal_type k=0; k<=p_k; ++k) {
              value_type cijk = (*Cijk_1d[0])(i, j, k);
              RCP<node_type> child =
                computeCijkLTBNodeBlockLeaf(bo, c1d,
                                            i_ltb->children[i],
                                            j_ltb->children[j],
                                            k_ltb->children[k],
                                            total_order, symmetric,
                                            size_threshold,
                                            sum_i + i,
                                            sum_j + j,
                                            sum_k + k,
                                            cijk_base*cijk,
                                            below_threshold);
              node->values.insert(node->values.end(),
                                  child->values.begin(),
                                  child->values.end());
            }
          }
        }
      }
      node->my_num_entries = node->values.size();
      node->total_num_entries = node->values.size();
      node->total_num_leafs = 1;
    }

    // General case -- call recursively stripping off first dimension
    // Could replace use of Cijk_Iterator with above formulas
    // Could we exploit global symmetry, e.g., store only blocks with j>=k?
    // Just looking at j_begin >= k_begin doesn't work
    else {
      node->is_leaf = false;
      ArrayView<const ordinal_type> bo = arrayView(&basis_orders[1], my_d-1);
      ArrayView<const RCP<Dense3Tensor<ordinal_type,value_type> > > c1d =
        arrayView(&Cijk_1d[1], my_d-1);
      node->total_num_entries = 0;
      node->total_num_leafs = 0;
      bool more = true;
      Cijk_Iterator cijk_iterator(p_i, p_j, p_k, symmetric);
      while (more) {
        value_type cijk =
          (*Cijk_1d[0])(cijk_iterator.i, cijk_iterator.j, cijk_iterator.k);
        RCP<node_type> child =
          computeCijkLTBNodeBlockLeaf(bo, c1d,
                                      i_ltb->children[cijk_iterator.i],
                                      j_ltb->children[cijk_iterator.j],
                                      k_ltb->children[cijk_iterator.k],
                                      total_order, symmetric,
                                      size_threshold,
                                      sum_i + cijk_iterator.i,
                                      sum_j + cijk_iterator.j,
                                      sum_k + cijk_iterator.k,
                                      cijk_base*cijk,
                                      below_threshold);
        node->children.push_back(child);
        node->total_num_entries += child->total_num_entries;
        node->total_num_leafs += child->total_num_leafs;
        more = cijk_iterator.increment();
      }
      node->my_num_entries = node->children.size();
    }

    return node;
  }

  template <typename ordinal_type>
  struct FlatLTBSparse3TensorNode {
    ordinal_type i_begin, j_begin, k_begin;
    ordinal_type i_size, j_size, k_size;
  };

  template <typename ordinal_type, typename value_type>
  struct FlatLTBSparse3Tensor {
    typedef Teuchos::Array< FlatLTBSparse3TensorNode<ordinal_type> > node_array_type;
    typedef Teuchos::Array< value_type > cijk_array_type;

    typedef typename node_array_type::iterator node_iterator;
    typedef typename node_array_type::const_iterator node_const_iterator;
    typedef typename cijk_array_type::iterator cijk_iterator;
    typedef typename cijk_array_type::const_iterator cijk_const_iterator;

    node_array_type node;
    cijk_array_type cijk;
    bool symmetric;
  };

  template <typename ordinal_type, typename value_type>
  Teuchos::RCP< FlatLTBSparse3Tensor<ordinal_type,value_type> >
  computeFlatTripleProductTensorLTB(
    const TotalOrderBasis<ordinal_type, value_type,LexographicLess<MultiIndex<ordinal_type> > >& product_basis,
    bool symmetric = false,
    const ordinal_type threshold = 0) {
#ifdef STOKHOS_TEUCHOS_TIME_MONITOR
    TEUCHOS_FUNC_TIME_MONITOR("Stokhos: Flat Triple-Product Tensor Time");
#endif
    using Teuchos::RCP;
    using Teuchos::rcp;

    // Build LTB 3 tensor
    typedef LTBSparse3Tensor<ordinal_type, value_type> Cijk_LTB_type;
    RCP<Cijk_LTB_type> ltb_tensor =
      computeTripleProductTensorLTBBlockLeaf(product_basis, symmetric,
                                             threshold);

    // Create flat LTB 3 tensor
    RCP< FlatLTBSparse3Tensor<ordinal_type,value_type> > flat_tensor =
      rcp(new FlatLTBSparse3Tensor<ordinal_type,value_type>);
    flat_tensor->node.reserve(ltb_tensor->num_leafs());
    flat_tensor->cijk.reserve(ltb_tensor->num_entries());
    flat_tensor->symmetric = symmetric;

    // Fill flat 3 tensor
    typedef typename Cijk_LTB_type::CijkNode node_type;
    Teuchos::Array< Teuchos::RCP<const node_type> > node_stack;
    Teuchos::Array< ordinal_type > index_stack;
    node_stack.push_back(ltb_tensor->getHeadNode());
    index_stack.push_back(0);
    Teuchos::RCP<const node_type> node;
    ordinal_type child_index;
    while (node_stack.size() > 0) {
      node = node_stack.back();
      child_index = index_stack.back();

      // Leaf
      if (node->is_leaf) {
        FlatLTBSparse3TensorNode<ordinal_type> leaf;
        leaf.i_begin = node->i_begin;
        leaf.j_begin = node->j_begin;
        leaf.k_begin = node->k_begin;
        leaf.i_size = node->i_size;
        leaf.j_size = node->j_size;
        leaf.k_size = node->k_size;
        flat_tensor->node.push_back(leaf);
        flat_tensor->cijk.insert(flat_tensor->cijk.end(), 
                                 node->values.begin(),
                                 node->values.end());
        node_stack.pop_back();
        index_stack.pop_back();
      }

      // More children to process -- process them first
      else if (child_index < node->children.size()) {
        ++index_stack.back();
        node = node->children[child_index];
        node_stack.push_back(node);
        index_stack.push_back(0);
      }

      // No more children
      else {
        node_stack.pop_back();
        index_stack.pop_back();
      }

    }

    return flat_tensor;
  }

  template <int max_size, typename ordinal_type, typename value_type>
  void
  flatLTB3TensorMultiply(
    OrthogPolyApprox<ordinal_type,value_type>& c,
    const OrthogPolyApprox<ordinal_type,value_type>& a,
    const OrthogPolyApprox<ordinal_type,value_type>& b,
    const FlatLTBSparse3Tensor<ordinal_type,value_type>& cijk) {
    value_type ab[max_size][max_size];

    // Set coefficients to 0
    c.init(value_type(0));

    // Get pointers to coefficients
    const value_type *ca = a.coeff();
    const value_type *cb = b.coeff();
    value_type *cc = c.coeff();

    typedef FlatLTBSparse3Tensor<ordinal_type,value_type> cijk_type;
    typedef typename cijk_type::node_const_iterator node_iterator;
    typedef typename cijk_type::cijk_const_iterator cijk_iterator;
    node_iterator ni = cijk.node.begin();
    node_iterator ni_end = cijk.node.end();
    cijk_iterator ci = cijk.cijk.begin();
    for (; ni != ni_end; ++ni) {
      value_type *c_block = cc + ni->i_begin;
      const value_type *a_block = ca + ni->j_begin;
      const value_type *b_block = cb + ni->k_begin;
      const ordinal_type i_size = ni->i_size;
      const ordinal_type j_size = ni->j_size;
      const ordinal_type k_size = ni->k_size;
      for (ordinal_type j=0; j<j_size; ++j)
        for (ordinal_type k=0; k<k_size; ++k)
          ab[j][k] = a_block[j]*b_block[k];
      if (cijk.symmetric) {
        for (ordinal_type i=0; i<i_size; ++i) {
          value_type tmp = value_type(0);
          for (ordinal_type j=0; j<j_size; ++j) {
            for (ordinal_type k=(i+j)%2; k<k_size; k+=2) {
              tmp += (*ci)*ab[j][k];
              ++ci;
            }
          }
          c_block[i] += tmp;
        }
      }
      else {
        for (ordinal_type i=0; i<i_size; ++i) {
          value_type tmp = value_type(0);
          for (ordinal_type j=0; j<j_size; ++j) {
            for (ordinal_type k=0; k<k_size; ++k) {
              tmp += (*ci)*ab[j][k];
              ++ci;
            }
          }
          c_block[i] += tmp;
        }
      }
    }
  }

} // namespace Stokhos

// Include template definitions
//#include "Stokhos_LTBSparse3TensorImp.hpp"

#endif // STOKHOS_LTB_SPARSE_3_TENSOR_HPP