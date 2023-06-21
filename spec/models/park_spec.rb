require 'rails_helper'

RSpec.describe Park, type: :model do
  let(:user) { create(:user) }
  
  describe 'パーク作成' do
    context 'パーク作成が成功する場合' do
      it '名前が存在すれば作成できる' do
        park = build(:park, user: user)
        expect(park).to be_valid
      end
    end

    context 'パーク作成が失敗する場合' do
      it '名前が空では作成できない' do
        park = build(:park, name: '', user: user)
        park.valid?
        expect(park.errors[:name]).to include("can't be blank")
      end

      it 'ユーザーが関連付けられていないと作成できない' do
        park = build(:park, user: nil)
        park.valid?
        expect(park.errors[:user]).to include("must exist")
      end
    end
  end
end