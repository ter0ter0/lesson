#! /bin/bash
echo "unkoファイルへようこそ"
echo "unkoファイルを作成します"
echo "出力したい文字を入力してください"
read  unko
echo "$unko" > unko.txt

while [ "$input" != "Exit" ]; do

echo "次へ進みますか？"
echo "Next or Exit" 
read input
case "$input" in

"Next")
	read -p  "メールアドレスを入力して下さい" mail
		if [ "$mail" = "panicdepanic@gmail.com" ]; then

			echo "暗号化ファイルを作成します"
			sudo gpg -e -a -r "${mail}" -o unko.gpg unko.txt

		else
			echo "メールアドレスが違います。もう一度やり直して下さい"
			continue
		fi


		echo "ファイルを複合化しますか？"
		echo "yes or no"
		read input2

		case "$input2" in

			"yes")
				echo "複合化します"

				sudo gpg -d unko.gpg

				# cat unko.txt
				;;

			"no")
				echo "Thank you"
				exit
				;;

			*)
				echo "yes or no で入力して下さい"
				;;
		esac
;;

"Exit")
        echo "Thank you"
        exit 1
	;;


*)
        echo "入力が違います。もう一度入力して下さい。"
	;;
esac

done
