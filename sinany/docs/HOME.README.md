Hi Sinan, welcome $HOME!

# Philosophy

My personal tendency is that my attention and focus are varied in where they are
focused and how they are focused, usually changing drastically within the scale
of days to weeks.

Therefore, the primary qualities I desire from my computing set up are
**Stability**, **Accessibility**, and **Maintainability**. I also tend to value
*Neatness* and *Elegance* to my personal standards.
- **Stability**: The system, over time, should remain constant in its behavior
  even without attention. It should not be vulnerable to frequent and sizeable
  regressions in behavior due to factors that is hard to standardize across time
  and setups.
- **Accessibility**: The system should be self-documenting and easy to operate
  at near-maximum capacity with little ramp-up. It should not assume a large
  swath of *working knowledge* -- those things that we forget are necessary to
  effectively operate a system but will nevertheless trip those who are coming
  to a system fresh with no or little fresh experience with the system.
- **Maintainability**: The system should make it easy to make changes to it --
  either for maintenance (fixing something that is broken, either due to initial
  mistakes, or over time), or enhancement (adding new features). This quality
  can be then broken down in to three categories where **Maintainability**
  matters;
  1. It should be easy to locate where changes are to be made (your software is
	 refactored such that its abstractions are sensible, riiiight?)
  2. It should be easy to make the changes to the system (your software is
	 modified in frequent, small chunks to ensure it malleability, riiiight?)
  3. It should be easy to verify that the changes had the desired effect (you
	 write tests, riiight?)
- *Neatness* and *Elegance* are personal preferences; it is a personal judgement
  that is too subjective to be documented and just subjective enough to be left
  for my own discretion.

# An Overview of the Environment

I hope you have a great time here. Here is a quick guide to what is around and
what is available for you to do;

`dot/` holds your dotfiles (configuration files that generally start with a
`.`), and it is synced to a (public GitHub
repository)[github.com/enjoythecode/dot/]

`S/` holds most of your non-code personal files that you care about;
- `S/Current` holds `Archive`-flavored (see next item) folders relating to
  themes that are ongoing
- `S/Archive/` with its many sub-folders for categorizing your filer
- `S/Zettelkasten` holds your personal flavor of Zettelkasten that is most
  commonly associated with the Obsidian text editor in your head.
- `S/Projects` holds only seed-size projects that have a low chance of survival
  (see `Projects.git` for projects proper)
- `S/beans` is where your personal finance lives; tracked with beancount
- `S/src` has some files to deal with my files, and `S/Makefile` is the entry
  point

`Projects.git` holds your code files that are synced with git; you'll find many
projects here.

TODO what else might I have?
TODO what about the other stuff? Do I not care about it, then?

# Insurance Against Bad Things

`S/` is synced using (SyncThing)[https://syncthing.net/]. `dot/` is on GitHub,
and so are the sub-folders of `Projects.git`.

We try to make sure that most things stay clear from outside these protected
areas. Some hoops need to be jumped to achieve this protection; for example,
this file is actually under `dot/`, but it is linked to be right under $HOME for
your convenience.

TODO where do I learn more about operating these insurances?

# Staying a While?

Most directories will have their own `README.md` and `TODO.md`. Opening these in
`$EDITOR` is currently aliased to `r` and `t`, respectively.

Try running `h` to run health checks on the system overall.
