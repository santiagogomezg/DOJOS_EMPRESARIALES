import { test } from 'qunit';
import moduleForAcceptance from 'ember-app/tests/helpers/module-for-acceptance';

moduleForAcceptance('Acceptance | accessing site');

test('should link to information shop.', function (assert) {
  visit('/');
  click('a:contains("Tienda")');
  andThen(function () {
    assert.equal(currentURL(), '/shop', 'should navigate to shop');
  });
});

test('should link to juegos information', function (assert) {
  visit('/');
  click('a:contains("Juegos")');
  andThen(function () {
    assert.equal(currentURL(), '/games', 'should navigate to juegos');
  });
});
