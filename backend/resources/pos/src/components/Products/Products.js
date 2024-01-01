import React, { useEffect, useState } from "react";
import PropTypes from "prop-types";
import { connect } from "react-redux";
import { fetchProducts, fetchProductsFromIndexDB } from "../../store/action/allproductAction";
import { fetchProduct, fetchProductFromIndexDB } from "../../store/action/fetchProduct";
import AddProductModifier from "./AddProductModifier";
import { CommonLoading } from "react-loadingg";
import { difference, pluck } from "../../helpers";
import { toFixedTrunc } from "../../shared/CalculateProductPrice"


const Products = (props) => {
    const { fetchProducts, fetchProductsFromIndexDB, products, cartProducts, selectedLocationId, updateCart, fetchProduct, fetchProductFromIndexDB, isLoading } = props;

    const [carts, setCarts] = useState([]);
    const [cartProductIds, setCartProductIds] = useState([]);
    const [product, setProduct] = useState(null);
    const [isModifierModelOpen, setIsModifierModelOpen] = useState(false);
    const [isWifiConnection, setIsWifiConnection] = useState(true);


    useEffect(() => {
        //every second check internet connection
        const interval = setInterval(() => {
            if (navigator.onLine) {
                setIsWifiConnection(true);
            } else {
                setIsWifiConnection(false);
            }
        }, 1000);

        return () => clearInterval(interval);
    }, []);


    useEffect(() => {
        if (!isWifiConnection) {
            fetchProductsFromIndexDB(selectedLocationId);
        } else {
            fetchProducts(selectedLocationId);
        }
    }, []);


    useEffect(() => {
        // update cart while cart is updated
        setCarts(cartProducts);
        const ids = cartProducts.map(item => {
            return item.product_row.product.variation_id
        })
        setCartProductIds(ids);
    }, [cartProducts]);

    const closeModifierModel = () => {
        setIsModifierModelOpen(false);
    }

    const addProductToCart = (cartProduct) => {
        const variationId = cartProduct.product_row.product.variation_id;
        let isNew = true;
        const existingCarts = carts.filter((e) => {
            if (e.product_row.product.variation_id !== variationId || cartProduct.modifiers.length !== e.modifiers.length) {
                return e;
            } else {
                const cartModifierIds = pluck(cartProduct.modifiers, 'id')
                const eModifierIds = pluck(e.modifiers, 'id')
                const diff = difference(cartModifierIds, new Set(eModifierIds))
                if (diff.size === 0) {
                    e.product_row.quantity = parseInt(e.product_row.quantity) + 1;
                    isNew = false;
                }
                return e;
            }
        })

        if (isNew) {
            existingCarts.push(cartProduct);
            const existingCartIds = cartProductIds.filter((id) => id !== variationId)
            setCartProductIds([...existingCartIds, variationId])
        }

        setCarts(existingCarts)
        updateCart(existingCarts);

        closeModifierModel();
    }

    const isProductExistInCart = (productId) => {
        return cartProductIds.includes(productId);
    }

    const addToCart = (product) => {
        let isCheckModifier = true;
        checkProductInStock(product);

    };


    const checkProductInStock = (product) => {
        fetchProductFromIndexDB(selectedLocationId, product.id, (cb) => {
            if (cb.product) {
                setProduct(cb.product);
                let taxId = null;
                if (cb.product.product_row.product.tax_dropdown != null) {
                    taxId = cb.product.product_row.product.tax_dropdown[0].id
                }
                cb.product.product_row.product.tax_id = taxId;
                if (cb.product.modifier_products.length) {
                    setIsModifierModelOpen(true);
                } else {
                    cb.product.modifiers = [];
                    addProductToCart(cb.product)
                }
            }
        });
        /*  if (!isWifiConnection) {
 
         } else {
             fetchProduct(selectedLocationId, product.id, (cb) => {
                 if (cb.product) {
                     setProduct(cb.product);
                     let taxId = null;
                     if (cb.product.product_row.product.tax_dropdown != null) {
                         taxId = cb.product.product_row.product.tax_dropdown[0].id
                     }
                     cb.product.product_row.product.tax_id = taxId;
                     if (cb.product.modifier_products.length) {
                         setIsModifierModelOpen(true);
                     } else {
                         cb.product.modifiers = [];
                         addProductToCart(cb.product)
                     }
                 }
             });
         } */

    }

    const sellingPrice = (product) => {
        /*  console.log('product'); */
        return toFixedTrunc(product.sell_price_inc_tax, 2);
        const countUnitPrice = toFixedTrunc(product.selling_price, 4);
        if (product.product_tax) {
            // const taxIntValue = (Math.ceil(product.product_tax * 100) / 100);
            const totalPrice = ((product.sell_price_inc_tax * product.tax_amount) / 100);
            return totalPrice;
        } else {
            return toFixedTrunc(product.sell_price_inc_tax, 2);
        }


    };

    const loadProductCard = (product, index) => {
        return (
            <div className="food-container__item-block" key={index}>
                <div
                    className={`${isProductExistInCart(product.id) ? 'product-active' : ''} card border-0 rounded-3`}
                    data-bs-toggle="modal"
                    data-bs-target="#addProductModal" onClick={() => addToCart(product, index)} >
                    <div className="card-header text-white rounded-top text-center"> {product.name} </div>
                    <div className="card-body">
                        <img src={product.product_image_url} className="d-block mx-auto my-2" alt="burger" />
                    </div>
                    <div class="card-footer">
                        <p className="text-primary text-center mb-0 food-container__price">
                            {sellingPrice(product)}
                        </p>
                    </div>
                </div>
            </div>
        );
    }

    return (
        <div className="position-relative">
            <div className="food-container p-2">
                <div className="row gx-0">
                    {
                        products.length !== 0 ? products.map((product, index) => { return loadProductCard(product, index); }) : isLoading ? <CommonLoading /> :
                            <h3 className="text-center">No Product Available</h3>
                    }
                </div>
            </div>
            {isModifierModelOpen && <AddProductModifier product={product} addProductInToCart={addProductToCart} closeModifierModel={closeModifierModel} />}
        </div>
    )
}

Products.propTypes = {
    fetchProducts: PropTypes.func,
    fetchProductsFromIndexDB: PropTypes.func,
    fetchProduct: PropTypes.func,
    fetchProductFromIndexDB: PropTypes.func,
};

const mapStateToProps = (state) => {
    const { products, isLoading } = state;
    return { products, isLoading };
};

export default connect(mapStateToProps, { fetchProductsFromIndexDB, fetchProducts, fetchProduct, fetchProductFromIndexDB })(Products);
