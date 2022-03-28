from collections import Counter
import math


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
    word_occurence_in_docs = Counter()
    for file in docs:
        with open(file, 'r') as curr_file:
            for line in curr_file:
                contents = line.split(" ")
                words = set(contents)
                word_occurence_in_docs.update(words)

    for file in docs:
        with open(file, 'r') as curr_file:
            for line in curr_file:
                contents = line.split(" ")
                word_occurence = Counter(contents)
                distinct_words = set(contents)
                tf_dict = {}
                idf_dict = {}
                tf_idf_dict = {}
                for word in distinct_words:
                    tf_dict[word] = word_occurence[word]/len(contents)
                    idf_dict[word] = ((math.log(len(docs) / word_occurence_in_docs[word])) + 1)
                    tf_idf_dict[word] = round((tf_dict[word] * idf_dict[word]), 2)


if __name__ == '__main__':
    docs = preprocessing()
    compute_tfidf(docs)


