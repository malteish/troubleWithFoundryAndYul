// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.13;

import "../lib/forge-std/src/Test.sol";

contract ContinuousFundraisingTest is Test {

    /**
     * Demonstrate that tests don't work as expected with Yul
     * This test should fail, and does fail when run with via-ir=false.
     * But it succeeds when compiled with via-ir=true.
     */
    function testYul() public {
        uint256 time = block.timestamp;
        assertTrue(time == 1, "time is not 1 at the beginning");
        console.log("stored time before: ", time);
        // Problem 1: this warp changes the contents of the "time" variable, even though it shouldn't
        vm.warp(2 hours);
        console.log("stored time after: ", time);

        // Problem 2: none of these assertions fail, even though at least one should
        assertTrue(time == 1, "time is not 1 after warp");
        assertTrue(time == 2 hours, "time is not 1 after warp");

        console.log("This line is executed even though it shouldn't be reachable");
    }
}
