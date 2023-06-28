# The Problem

Some foundry tests behave differently when the project is compiled with the `via-ir` flag or without.

# How to reproduce

1. `git clone --recurse-submodules git@github.com:malteish/troubleWithFoundryAndYul.git` to clone this repo
2. `cd` into the local copy of this repo
3. `forge test -vv`. This executes the one test and shows the corresponding output. The test passes, even though it should definitely fail. Read the test for more details.
4. `FOUNDRY_PROFILE=noYUL forge test -vv`. This compiles the project without the `via-ir` flag. The test fails, as expected.

Please notice there are at least 2 problems here, which are described in the test.
