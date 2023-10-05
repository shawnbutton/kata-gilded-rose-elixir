# Gilded Rose Kata

This is the Elixir code kata for Gilded Rose as curated by Emily Bache in her
[master repository](https://github.com/emilybache/GildedRose-Refactoring-Kata)

We have added additional documentation and tuned this repository for use at RBC
among our development teams.

## Gilded Rose Requirements Specification

Hi and welcome to team Gilded Rose. As you know, we are a small inn with a prime location in a
prominent city ran by a friendly innkeeper named Allison. We also buy and sell only the finest goods.
Unfortunately, our goods are constantly degrading in quality as they approach their sell by date. We
have a system in place that updates our inventory for us. It was developed by a no-nonsense type named
Leeroy, who has moved on to new adventures. Your task is to add the new feature to our system so that
we can begin selling a new category of items.

First an introduction to our system:

- All items have a SellIn value which denotes the number of days we have to sell the item
- All items have a Quality value which denotes how valuable the item is
- At the end of each day our system lowers both values for every item

Pretty simple, right? Well this is where it gets interesting:

- Once the sell by date has passed, Quality degrades twice as fast
- The Quality of an item is never negative
- "Aged Brie" actually increases in Quality the older it gets
- The Quality of an item is never more than 50
- "Sulfuras", being a legendary item, never has to be sold or decreases in Quality
- "Backstage passes", like aged brie, increases in Quality as its SellIn value approaches;
  Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but
  Quality drops to 0 after the concert

We have recently signed a supplier of conjured items. This requires an update to our system:

- "Conjured" items degrade in Quality twice as fast as normal items

Feel free to make any changes to the UpdateQuality method and add any new code as long as everything
still works correctly. However, do not alter the Item class or Items property as those belong to the
goblin in the corner who will insta-rage and one-shot you as he doesn't believe in shared code
ownership (you can make the UpdateQuality method and Items property static if you like, we'll cover
for you).

Just for clarification, an item can never have its Quality increase above 50, however "Sulfuras" is a
legendary item and as such its Quality is 80 and it never alters.

# Facilitators Notes

This repository is a reasonable starting-point for a typescript-based Gilded Rose
kata using Jest for testing.

## Guidance for mob.sh

Mob.sh is a simple GO script that facilitates mobbing and pairing using a git
branch as a go-between. It aims to be very simple in its implementation.

### TL;DR

- `brew install remotemobprogramming/brew/mob`
- `mob start -b [unique_name]` starts a mob session with a uniquely named
  coordination branch
- `mob next` to hand control off to the next pilot
- `mob start -b [unique_name]` to pick-up control for the next pilot
- `mob done` when you're done to drop all changes (squashed, staged) ready to
  commit to the branch you started in

### Setting Up

Ensure you have mob.sh installed:

```
brew install remotemobprogramming/brew/mob
```

### Usage

The person starting off the mob session starts in the master branch of the
repository and types:

```
mob start -b (choose a unique name)
```

_Note: It's important when there may be many simultaneous mob/pairing sessions
within a repository to specify a unique name for your particular mob session.
This determines a unique branch name for coordination that won't clash with
other sessions. The branch name used for the mob session will end up looking
something like `mob/master/story123456`._

For a unique name, choose something that suits you:

- a story number
- a handle
- something random or made up
- no spaces or punctuation!

This places you in a special branch in which all mobbing takes place until your
session is complete.

There is no need to make discreet commits - commits along the mob branch are
squashed and presented at the end as a set of uncommitted files in the branch in
which you started.

When the first pilot is ready to hand the session off to a co-pilot, they issue
the command:

```
mob next
```

This will create a work-in-progress commit, push the changes up to the git repo,
and will then be ready for the next pilot to take control.

The next pilot takes control with:

```
mob start -b (the same unique name you started with)
```

And this is how it goes as you bounce control between the pilots in your mobbing
session. When the session is done, the last pilot issues:

```
mob done
```

This will squash all work-in-progress commits along the mob branch and present
them as uncommited changes to the master. It's then just a normal commit to
master for all the work completed by everyone in the mob.

For example:

```
git commit -am "describe the work done here, tag a jira ticket"
git push
```

And that's it!

Happy Mobbing / Pairing!

Please direct any questions to Shawn Button <shawnbutton@gmail.com>