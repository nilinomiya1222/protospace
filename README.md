== README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

#データベース構成

##usersテーブル
###カラム

    id
    name
    email
    password
    avatar
    group
    profile
    works

###アソシエーション

    has_many :prototypes
    has_many :comments
    has_many :likes


##prototypesテーブル
###カラム

    id
    name
    user_id
    copy
    concept

###アソシエーション

    belongs_to :user
    has_many :images
    has_many :comments
    has_many :tags through :proto_tag
    has_many :likes

##tagsテーブル
###カラム

    id
    tag_name

###アソシエーション

    has_many :prototypes through :proto_tag

##proto_tagテーブル
###カラム

    proto_id
    tag_id

###アソシエーション

    belongs_to :prototype
    belongs_to :user


##imagesテーブル
###カラム

    id
    type(メインの大きな画像か小さな画像かを指定します)
    image
    proto_id

###アソシエーション
    belongs_to :prototype

##commentsテーブル
###カラム

    id
    user_id
    proto_id
    text

###アソシエーション
    belongs_to :user
    belongs_to :prototype

##likesテーブル
###カラム

    id
    proto_id
    user_id

###アソシエーション

    belongs_to :user
    belongs_to :prototype



* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
