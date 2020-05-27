with open("gdpr_annotating.txt", "r") as fr:
    text = fr.read()
    lines = fr.readlines()

articles = []
for line in lines:
    if line.startwith("# ::snt"):
        articles.append(line[8:])

print(articles[0])
