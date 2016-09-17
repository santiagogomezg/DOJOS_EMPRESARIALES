import { test } from 'qunit';
import moduleForAcceptance from 'ember-app/tests/helpers/module-for-acceptance';

moduleForAcceptance('Acceptance | list juego');

test('should redirect to games ', function (assert) {
  visit('/');
  andThen(function() {
    assert.equal(currentURL(), '/games', 'should redirect automatically');
  });
});

test('should list available juegos.', function (assert) {
  visit('/');
  andThen(function () {
    assert.equal(find('.listing').length, 3, 'should see 3 listings');
  });
});
