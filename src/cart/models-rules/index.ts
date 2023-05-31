import { Cart } from '../../entries/cart';
import { CartItem } from '../../entries/cart_item';

export function calculateCartTotal(cart: Cart): number {
  return cart
    ? cart.items.reduce((acc: number, { price, count }: CartItem) => {
        return (acc += price * count);
      }, 0)
    : 0;
}
