import re


def stopwords():
    stopwords_list = []
    for word in open('stopwords.txt', 'r'):
        word = word.strip('\n')
        stopwords_list.append(word)
    return stopwords_list


def preprocessing():
    preprocessed_docs = []
    for file in open('tfidf_docs.txt', 'r'):
        file = file.strip('\n')
        with open(file, 'r') as curr_file:
            newline = ""
            for line in curr_file:
                line_strip = line.replace('\n', " ")
                newline += line_strip
            full_content = newline.split(" ")
            new_contents = []
            punc = '''!()-[]{};:'"\,<>./?@#$%^&*~'''
            for item in full_content:
                item = item.lower()
                for char in item:
                    if char in punc:
                        item = item.replace(char, "")
                if item not in stopwords():
                    if 'ing' in item[-3:]:
                        item = item[:-3]
                    if 'ly' in item[-2:]:
                        item = item[:-2]
                    if 'ment' in item[-4:]:
                        item = item[:-4]
                    if 'https' in item or 'http' in item:
                        continue
                    if '\n' in item:
                        item = item.replace('\n', ' ')
                    new_contents.append(item)
            preprocfile = "preproc_" + file
            preprocessed_docs.append(preprocfile)
            while ('' in new_contents):
                new_contents.remove('')
            with open(preprocfile, 'w') as new_file:
                new_file.write(' '.join(new_contents))
    return preprocessed_docs


def compute_tfidf(docs):
    for file in docs:
        pass

if __name__ == '__main__':
    docs = preprocessing()
    compute_tfidf(docs)


