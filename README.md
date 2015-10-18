== README

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
    has_many :likes

##prototypesテーブル
###カラム

    id
    name
    user_id
    copy
    concept
    comments_count
    likes_count

###アソシエーション

    belongs_to :user
    has_many :images
    has_many :comments
    has_many :likes

##tagsテーブル
###カラム

    id
    tag_name


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
    proto_id
    text

###アソシエーション
    belongs_to :user
    belongs_to :prototype

##likesテーブル
###カラム

    id
    proto_id

###アソシエーション

    belongs_to :user
    belongs_to :prototype

