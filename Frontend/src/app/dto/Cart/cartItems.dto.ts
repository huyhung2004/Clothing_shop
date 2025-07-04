export interface CartItem {
  id: number;
  image: string;
  name: string;
  price: number;
  numberOfProducts: number;
  orderId?: number;
}
