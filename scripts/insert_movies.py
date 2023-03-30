import requests


def main():
	FILE = open("movies.txt", "r")
	lines = FILE.read().split("\n")
	FILE.close()

	sql = "INSERT INTO movies (title, description, age_rating, price, genre_id) VALUES " 
	for line in lines:
		if not line:
			continue

		id, title, desc, age_rating, price, genre_id = line.replace("'", "\\'").split("\t")
		sql += f"('{title}', '{desc}', '{age_rating}', '{price}', '{genre_id}'),\n"

	sql = sql[:-2]
	sql += ";"

	print(sql)

	r = requests.post("http://localhost/post_sql.php", data={
		"dbname" : "video_rental",
		"sql" : sql
	})

	print(r.text)
	if "Ok" in r.text:
		print("Success")
	else:
		print(r.text)

if __name__ == "__main__":
	main()

