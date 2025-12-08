import typst
import json

def handle_functype(child):
    if child['func'] == 'parbreak' or child['func'] == 'space' or child['func'] == 'smartquote':
        #nothing interesting
        pass
    elif child['func'] == 'text':
        print(child['text'], end="")
    elif child['func'] == 'quote':
        attribution = child['attribution']['text']
        for quote_child in child['body']['children']:
            handle_functype(quote_child)
        print("[" + attribution + "] ", end="")
    else:
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
        print(child['func'], "not yet accounted for")
        print(child)

def main():
    testfile = "../../../src/philosophers/nicomachus-of-gerasa.simple.typ"
    result = typst.query(testfile, "<body>", format="json", one=False)
    data = json.loads(result)
    for child in data[0]["children"]:
        handle_functype(child)

if __name__ == "__main__":
    main()
