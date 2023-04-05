
import 'package:thought_sort/classes/persistence.dart';
import 'package:test/test.dart';


bool allDifferent(List<Thought> thoughts) {
    bool isAllDifferent = true;
    for (var thought in thoughts) {
        for (var thought2 in thoughts) {
            if (thought != thought2 && thought.id == thought2.id) {
                isAllDifferent = false;
            }
        }
    }
    return isAllDifferent;
}

void main() {
    group('Testing index function', () {
        List<Thought> thoughts = [];
        // you don't have to use generateIndex() if you
        // think of another way to implement it just change
        // the tests accordingly
        Thought thought1 = Thought(generateIndex(), DateTime(2022), 'first thought');
        Thought thought2 = Thought(generateIndex(), DateTime(2021), 'second thought');
        Thought thought3 = Thought(generateIndex(), DateTime(2021), 'third thought');
        Thought thought4 = Thought(generateIndex(), DateTime(2021), 'fourth thought');
        Thought thought5 = Thought(generateIndex(), DateTime(2021), 'fifth thought');
        thoughts.add(thought1);
        thoughts.add(thought2);
        thoughts.add(thought3);
        thoughts.add(thought4);
        thoughts.add(thought5);

        test('compare if two thoughts have different ids', () {
            expect(thought1.id != thought2.id, true);
        });

        test('compare all thoughts have different ids', () {
            expect(allDifferent(thoughts), true);
        });

        test('save ids through save and load', () {
            saveThoughts("testing", thoughts);
            List<Thought> newThoughts = loadThoughts("testing");
            expect(allDifferent(newThoughts), true);
        });

        test('deleting thoughts', () {
            thoughts.removeAt(0);
            expect(allDifferent(thoughts), true);
        });

        test('adding and deleting', () {
            thoughts.removeAt(0);
            thoughts.removeAt(0);
            thoughts.removeAt(0);
            thoughts.add(Thought(generateIndex(),  DateTime(2021), 'fifth thought'));
            thoughts.add(Thought(generateIndex(),  DateTime(2021), 'seventh thought'));
            thoughts.add(Thought(generateIndex(),  DateTime(2021), 'eighth thought'));
            expect(allDifferent(thoughts), true);
        });

    });
}