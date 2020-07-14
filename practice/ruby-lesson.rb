result = rand(9)
input = ""
while input!=result
  puts "0～9の数字を入力してください"
  input =  gets.to_i
  if input>result
    puts input.to_s+"より小さい数字です"
  elsif input<result
    puts input.to_s+"より大きい数字です"
  end
end
puts "正解！"+result.to_s+"でした！"

num=1
while num<=50
  if num%3==0 or num.to_s.include? "3"
    puts "Aho"
  else
    puts num
  end
  num=num+1
end


def register_review(reviews)
  puts "商品名を入力してください"
  input_name=gets.chomp
  puts "感想を入力してください"
  input_view=gets.chomp
  review={name:input_name,view:input_view}
  reviews << review
  puts "登録しました！"
end

def show_reviews(reviews)
  reviews.each do |review|
  puts "----------------------------"
  puts "商品名：#{review[:name]}"
  puts "　感想：#{review[:view]}"
  end
end

reviews = []
while true do
  puts "番号を入力してください"
  puts "[1] レビューを登録する"
  puts "[2] レビューの一覧を見る"
  puts "[3] アプリを終了する。"
  input = gets.to_i
  case input
  when 1
    register_review(reviews)
  when 2
    show_reviews(reviews)
  when 3
      exit
  end
end
