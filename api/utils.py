class get_concepts_upto(object):

    def __init__(self):
        self.prev_concepts = []


    def filter_concepts(self,row):
        final_list = []
        curr_concepts = row['concepts'].split('_')
        
        for c1 in curr_concepts:
            if not(c1 in self.prev_concepts):
                final_list.append(c1)
        
        self.prev_concepts.extend(curr_concepts)

        return '_'.join(final_list)