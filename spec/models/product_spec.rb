require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品' do
    context '商品出品できるとき' do
      it 'すべての項目が存在すれば登録できる' do
        expect(@product).to be_valid
      end
    end
    context '商品出品できないとき' do
      it '商品画像が必須であること' do
        @product.image = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Image can't be blank"
      end
      it '商品名が必須であること' do
        @product.title = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Title can't be blank"
      end
      it '商品の説明が必須であること' do
        @product.description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Description can't be blank"
      end
      it 'カテゴリーの情報が必須であること' do
        @product.category_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Category can't be blank"
      end
      it 'カテゴリーの情報が「---」だと登録できないこと' do
        @product.category_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include "Category can't be blank"
      end
      it '商品状態の情報必須であること' do
        @product.condition_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Condition can't be blank"
      end
      it '商品状態の情報が「---」だと登録できないこと' do
        @product.condition_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include "Condition can't be blank"
      end
      it '配送料の負担の情報が必須であること' do
        @product.shipping_fee_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Shipping fee can't be blank"
      end
      it '配送料の負担の情報が「---」だと登録できないこと' do
        @product.shipping_fee_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include "Shipping fee can't be blank"
      end
      it '発送元の地域の情報が必須であること' do
        @product.prefecture_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Prefecture can't be blank"
      end
      it '発送元の地域の情報が「---」だと登録できないこと' do
        @product.prefecture_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include "Prefecture can't be blank"
      end
      it '発送までの日数の情報が必須であること' do
        @product.shipping_date_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Shipping date can't be blank"
      end
      it '発送までの日数の情報が「---」だと登録できないこと' do
        @product.shipping_date_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include "Shipping date can't be blank"
      end
      it '価格の情報が必須であること' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Price can't be blank"
      end
      it '価格は半角数値のみ保存可能であること' do
        @product.price = '１００００'
        @product.valid?
        expect(@product.errors.full_messages).to include 'Price is not a number'
      end
      it '価格は300円未満では出品できないこと' do
        @product.price = '100'
        @product.valid?
        expect(@product.errors.full_messages).to include 'Price must be greater than or equal to 300'
      end
      it '価格は10000000円以上では出品できないこと' do
        @product.price = '10000000'
        @product.valid?
        expect(@product.errors.full_messages).to include 'Price must be less than or equal to 9999999'
      end
    end
  end
end
