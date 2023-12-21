export const toFixedTrunc = (x, n) => {
    const abc = typeof x === 'string' ? x : x.toString();
    const v = abc.split('.');
    if (n <= 0) return v[0];
    let f = v[1] || '';
    if (f.length > n) return `${v[0]}.${f.substr(0, n)}`;
    while (f.length < n) f += '0';
    return `${v[0]}.${f}`
}

export const calculatePrice = (cartItem) => {

    console.log("cartItem>>>", cartItem);
    const tax = calculateTax(cartItem);
    const countUnitPrice = cartItem.product_row.product.unit_price;
    const sell_price_inc_tax = cartItem.product_row.product.sell_price_inc_tax;
    const unit_price_inc_tax = cartItem.product_row.product.unit_price_inc_tax;
    const amountTax = +countUnitPrice * tax / 100;

    // prepare a price for single item
    let price = cartItem.product_row.product.tax_type === 'exclusive' ? +countUnitPrice : +countUnitPrice + amountTax;
    // prepare modifiers
    // const modifierPrice = calculateModifierAmount(cartItem);
    const qty = cartItem.product_row.quantity ?? 0;
    // const subAmount = price;
    const subTotalAmount = unit_price_inc_tax;
    const discount = cartItem.product_row.discount && cartItem.product_row.discount.discount_amount ? countDiscount(cartItem, subTotalAmount) : 0;
    // const tax = calculateTax(cartItem);
    let totalAmount = subTotalAmount - discount;
    let fixTotalAmount = totalAmount.toFixed(2);
    let modifiersTax = 0;
    let totalModifierPrice = 0;

    if (cartItem.modifiers.length > 0) {
        let totalTax = 0;
        cartItem.modifiers.forEach(modifier => {
            // if (modifier.tax_dropdown) {
            const modifierTax = calculateModifierTax(modifier);
            const modifierPrice = toFixedTrunc(modifier.default_sell_price, 4);
            totalModifierPrice = totalModifierPrice + +modifierPrice;
            if (modifierTax > 0) {
                totalTax = modifierPrice * modifierTax / 100;
                modifiersTax = modifiersTax + totalTax;
            }
            // }
        })

        const subtotalModifiers = totalModifierPrice;
        const subtotalModifierTax = +modifiersTax;

        fixTotalAmount = (+fixTotalAmount + subtotalModifierTax + subtotalModifiers).toFixed(2);
    }

    return (+fixTotalAmount * qty).toFixed(2);
}

// Calculate total price of cart
export const calculateCartTotalPrice = (carts) => {
    let totalAmount = 0;
    carts.forEach(cart => {
        totalAmount = totalAmount + parseFloat(calculatePrice(cart))
    })

    return totalAmount.toFixed(2);
};

const countDiscount = (cartItem, price) => {
    if (cartItem.product_row.discount.discount_type === "percentage") {
        return (+price / 100) * +cartItem.product_row.discount.discount_amount;
    }

    return +cartItem.product_row.discount.discount_amount;
};

const calculateTax = (cartItem) => {
    let tax = 0;
    if (cartItem.product_row.product.tax_id != null) {
        const selectedTax = cartItem.product_row.all_tax_dropdown.filter((t) => t.id === +cartItem.product_row.product.tax_id);
        if (selectedTax.length > 0) {
            tax = selectedTax[0].amount;
        }
    } else {
        if (cartItem.product_row.tax_dropdown) {
            tax = cartItem.product_row.tax_dropdown.amount;
        } else {
            tax = +cartItem.product_row.product.tax_id;
        }
    }

    return +tax;
};

const calculateModifierTax = (cartItem) => {
    let tax = cartItem.tax_dropdown ? cartItem.tax_dropdown.amount : 0;

    return +tax;
};

// Calculate total Tax of cart
export const calculateCartTotalTax = (carts) => {
    let totalAmount = 0;
    carts.forEach(cartItem => {
        let modifiersTax = 0;
        let modifierPrice = 0;
        let totalTax = 0;
        const qty = cartItem.product_row.quantity ?? 0;

        cartItem.modifiers.forEach(modifier => {
            if (modifier.tax_dropdown) {
                const tax = calculateModifierTax(modifier);
                modifierPrice = toFixedTrunc(modifier.default_sell_price, 4);
                if (tax > 0) {
                    totalTax = modifierPrice * tax / 100;
                    modifiersTax = (modifiersTax + totalTax.toFixed(2) * qty);
                }
            }
        })
        if (cartItem.product_row.tax_dropdown) {
            let countPrice = toFixedTrunc(cartItem.product_row.product.unit_price, 4)
            let price = +countPrice;
            const discount = cartItem.product_row.discount && cartItem.product_row.discount.discount_amount ? countDiscount(cartItem, price) : 0;
            const modifiers = cartItem.modifiers ?? [];
            let modifierPrice = 0;
            const tax = calculateTax(cartItem);
            modifiers.forEach(modifier => {
                modifierPrice = modifierPrice + parseFloat(modifier.sell_price_inc_tax);
            });

            if (tax > 0) {
                // const totalPrice = (price - discount) * qty
                // const taxAmount = totalPrice * tax / 100;
                const taxAmount = price * tax / 100;
                const taxQTY = taxAmount.toFixed(2) * qty;

                totalAmount = (+totalAmount + +taxQTY + +modifiersTax);
            }
        } else {
            totalAmount = totalAmount + modifiersTax
        }
    });
    return totalAmount.toFixed(2);
};

export const calculateCartTotalModifierTax = (carts) => {
    let totalAmount = 0;
    carts.forEach(cartItem => {
        let totalTax = 0;
        let modifierPrice = 0;
        const qty = cartItem.product_row.quantity ?? 0;

        cartItem.modifiers.forEach(modifier => {
            if (modifier.tax_dropdown) {
                const tax = calculateModifierTax(modifier);
                modifierPrice = toFixedTrunc(modifier.default_sell_price, 4);

                if (tax > 0) {
                    totalTax = modifierPrice * tax / 100;
                    totalAmount = (totalAmount + totalTax.toFixed(2) * qty);
                }
            }
        })
    });
    return totalAmount.toFixed(2);
};

// Calculate total Discount of cart
export const calculateCartTotalDiscount = (carts) => {
    let totalAmount = 0;

    carts.forEach(cartItem => {
        totalAmount = totalAmount + calculateProductDiscount(cartItem);
    });

    return parseFloat(totalAmount).toFixed(2);
}

// Calculate total Discount of cart
export const calculateCartTotalDiscountType = (carts) => {
    let discountType = 'null';


    carts.forEach(cartItem => {
        if (!cartItem.product_row.discount || !cartItem.product_row.discount.discount_amount || !cartItem.product_row.discount.discount_type) {
            return discountType;
        }
        discountType = cartItem.product_row.discount && cartItem.product_row.discount.discount_type ? cartItem.product_row.discount.discount_type : "null";
    });

    return discountType;
}

const calculateModifierAmount = (cartItem) => {
    const modifiers = cartItem.modifiers ?? [];
    let modifierPrice = 0;
    modifiers.forEach(modifier => {
        modifierPrice = modifierPrice + +toFixedTrunc(modifier.sell_price_inc_tax, 2);
    });

    return +modifierPrice.toFixed(2);
}

// Calculate Discount of one Product
export const calculateProductDiscount = (cartItem) => {

    if (!cartItem.product_row.discount || !cartItem.product_row.discount.discount_amount) {
        return 0;
    }

    // prepare a price for single item
    const price = +cartItem.product_row.product.default_sell_price;
    // prepare modifiers
    const modifierPrice = calculateModifierAmount(cartItem);
    const qty = cartItem.product_row.quantity ?? 0;
    const subAmount = price + modifierPrice * qty;
    return countDiscount(cartItem, subAmount);
}
