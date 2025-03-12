require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, token: "tok_#{SecureRandom.hex(10)}")
  end

  describe '購入情報の保存' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'zipcodeが空だと保存できないこと' do
        @order_address.zipcode = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zipcode can't be blank")
      end
      it 'zipcodeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.zipcode = '1111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Zipcode is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'prefecture_idを選択していないと保存できないこと' do
        @order_address.prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'prefecture_idが「---」だと保存できないこと' do
        @order_address.prefecture_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'cityが空だと保存できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "City can't be blank"
      end
      it 'phoneが空だと保存できないこと' do
        @order_address.phone = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone can't be blank"
      end
      it 'phoneが半角数字以外だと保存できないこと' do
        @order_address.phone = '０９０１１１１１１１１'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Phone number is invalid. Input only number'
      end
      it 'phoneに「-」があると保存できないこと' do
        @order_address.phone = '090-111-111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Phone number is invalid. Input only number'
      end
      it 'phoneが10桁未満だと保存できないこと' do
        @order_address.phone = '090111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Phone number is too short'
      end
      it 'phoneが12桁以上だと保存できないこと' do
        @order_address.phone = '090111111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Phone number is too long'
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "User can't be blank"
      end
      it 'tokenが紐付いていないと保存できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Token can't be blank"
      end
    end
  end
end
