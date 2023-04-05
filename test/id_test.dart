
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
        Thought thought1 = Thought(generateId(thoughts), DateTime(2022), 'first thought');
        thoughts.add(thought1);
        Thought thought2 = Thought(generateId(thoughts), DateTime(2021), 'second thought');
        thoughts.add(thought2);
        Thought thought3 = Thought(generateId(thoughts), DateTime(2021), 'third thought');
        thoughts.add(thought3);
        Thought thought4 = Thought(generateId(thoughts), DateTime(2021), 'fourth thought');
        thoughts.add(thought4);
        Thought thought5 = Thought(generateId(thoughts), DateTime(2021), 'fifth thought');
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
            thoughts.add(Thought(generateId(thoughts),  DateTime(2021), 'fifth thought'));
            thoughts.add(Thought(generateId(thoughts),  DateTime(2021), 'seventh thought'));
            thoughts.add(Thought(generateId(thoughts),  DateTime(2021), 'eighth thought'));
            expect(allDifferent(thoughts), true);
        });

    });
}