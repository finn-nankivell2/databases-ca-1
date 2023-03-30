import requests
from random import randint


def main():
	FILE = open("customers.txt", "r")
	lines = FILE.read().split("\n")
	FILE.close()

	sql = "INSERT INTO customers (first_name, second_name, dob, address, membership) VALUES "
	for line in lines:
		if not line:
			continue

		id, name, dob, address, membership = line.replace("'", "\\'").split("\t")
		first_name, second_name = name.split(" ")

		dob_rand = f"{randint(1966, 2006)}-{randint(1, 12)}-{randint(1, 25)}"

		sql += f"('{first_name}', '{second_name}', '{dob_rand}', '{address}', '{membership}'),\n"

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

