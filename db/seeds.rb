# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
    email: "admin@admin.com",
    password: "password"
)
EndUser.create!(
    email: "user@user.com",
    password: "password",
    last_name: "幸希", 
    first_name: "高橋", 
    last_name_kana: "コウキ",
    first_name_kana: "タカハシ", 
    post_code: "431-1324",
    address: "浜松市北区細江町中川809-222",
    phone_number: "000-0000-0000"
)
Genre.create!(
    name: "ケーキ"
)
Genre.create!(
    name: "マフィン"
)
Genre.create!(
    name: "ゼリー"
)
Item.create!(
    genre_id: 1, 
    name: "長野ケーキ", 
    explanation: "これは一つ目の検証データ", 
    price: 1000, 
    is_saled: true
)
Item.create!(
    genre_id: 2, 
    name: "長野マフィン", 
    explanation: "これは一つ目の検証データ", 
    price: 1000, 
    is_saled: true
)
Item.create!(
    genre_id: 3, 
    name: "長野ゼリー", 
    explanation: "これは一つ目の検証データ", 
    price: 1000, 
    is_saled: true
)
Item.create!(
    genre_id: 3, 
    name: "長野ゼリー2", 
    explanation: "これは一つ目の検証データ", 
    price: 1000, 
    is_saled: true
)
Item.create!(
    genre_id: 3, 
    name: "長野ゼリー5", 
    explanation: "これは一つ目の検証データ", 
    price: 1000, 
    is_saled: true
)
Item.create!(
    genre_id: 3, 
    name: "長野ゼリー6", 
    explanation: "これは一つ目の検証データ", 
    price: 1000, 
    is_saled: true
)
Item.create!(
    genre_id: 3, 
    name: "長野ゼリー7", 
    explanation: "これは一つ目の検証データ", 
    price: 1000, 
    is_saled: true
)