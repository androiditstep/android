
template = "INSERT INTO questions(content, category_id) VALUES ('{}', {});\n"

data = {
    1: 'basic.txt',
    2: 'oop.txt',
    3: 'exceptions.txt',
    4: 'collections.txt',
    5: 'strings.txt'
}

o = open('data.sql', mode='w', encoding='utf8')
for n, name in data.items():
    with open(name, encoding='utf8') as f:
        for q in f:
            #print(template.format(q, n))
            o.write(template.format(q.replace('\n', ''), n))
o.close()
