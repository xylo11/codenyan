require 'rails_helper'

RSpec.describe UserProfile, type: :model do
  before do
    @user_profile = FactoryBot.build(:user_profile)
  end

  describe 'ユーザープロフィールの更新' do
    context '更新できる場合' do
      it 'ニックネームが存在し、アバターのフォーマットが正しく、サイズが1MB以下なら更新できる' do
        expect(@user_profile).to be_valid
      end
    end

    context '更新できない場合' do
      it 'nicknameが空だと更新できない' do
        @user_profile.nickname = ''
        @user_profile.valid?
        expect(@user_profile.errors.full_messages).to include "Nickname can't be blank"
      end

      it 'アバターのサイズが1MBを超えると更新できない' do
        @user_profile.avatar = fixture_file_upload(Rails.root.join('spec', 'fixtures', 'large_file.png'))
        @user_profile.valid?
        expect(@user_profile.errors.full_messages).to include('Avatar is too big')
      end

      it 'アバターの形式がJPEGまたはPNGでないと更新できない' do
        @user_profile.avatar = fixture_file_upload(Rails.root.join('spec', 'fixtures', 'file.txt'))
        @user_profile.valid?
        expect(@user_profile.errors.full_messages).to include('Avatar must be a JPEG or PNG')
      end
    end
  end
end