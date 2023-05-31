import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { SnakeNamingStrategy } from 'typeorm-naming-strategies';
import { Cart } from '../entries/cart';
import { CartItem } from '../entries/cart_item';
import { Order } from '../entries/order';

@Module({
  imports: [
    TypeOrmModule.forRoot({
      type: 'postgres',
      host: process.env.DB_HOST,
      port: +process.env.DB_PORT,
      username: process.env.DB_USERNAME,
      password: process.env.DB_PASSWORD,
      database: process.env.DB_NAME,
      logging: true,
      namingStrategy: new SnakeNamingStrategy(),
      entities: [Cart, CartItem, Order],
    }),
    TypeOrmModule.forFeature([Cart, CartItem, Order]),
  ],
  exports: [TypeOrmModule],
})
export class DatabaseModule {}