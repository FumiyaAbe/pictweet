require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before do
    @tweet = FactoryBot.build(:tweet)
  end

  describe 'ツイートの保存' do
    context 'ツイートが投稿できる場合' do
      it '画像とテキストを投稿できる' do
        expect(@tweet).to be_valid
      end
      it 'テキストのみで投稿できる' do
        @tweet.image = ''
        expect(@tweet).to be_valid
      end
    end
    context 'ツイートが投稿できない場合' do
      it 'テキストが空では投稿できない' do
        @tweet.text = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Text can't be blank")
      end     
      it 'ユーザーが紐付いていなければ投稿できない' do
        @tweet.user = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('User must exist')
      end
    end
  end

    RSpec.describe 'ツイート削除', type: :system do
    before do
      @tweet1 = FactoryBot.create(:tweet)
      @tweet2 = FactoryBot.create(:tweet)
    end
    context 'ツイート削除ができるとき' do
      it 'ログインしたユーザーは自らが投稿したツイートの削除ができる' do
        # ツイート1を投稿したユーザーでログインする
        # ツイート1に「削除」へのリンクがあることを確認する
        # 投稿を削除するとレコードの数が1減ることを確認する
        # トップページにはツイート1の内容が存在しないことを確認する（画像）
        # トップページにはツイート1の内容が存在しないことを確認する（テキスト）
      end
    end
    context 'ツイート削除ができないとき' do
      it 'ログインしたユーザーは自分以外が投稿したツイートの削除ができない' do
        # ツイート1を投稿したユーザーでログインする
        # ツイート2に「削除」へのリンクがないことを確認する
      end
      it 'ログインしていないとツイートの削除ボタンがない' do
        # トップページに移動する
        # ツイート1に「削除」へのリンクがないことを確認する
        # ツイート2に「削除」へのリンクがないことを確認する
      end
    end
  end
end
