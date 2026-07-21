.syntax unified
.cpu cortex-m4
.thumb

.global puzzle_bitmaster
.global puzzle_mathriddle
.global puzzle_password

.text

/*       Puzzle 1: BitMaser           */
/* BitMaster uses knowledge from digital logic to respectively answer the hidden code. */
/* Solve the encrypted message behind 1s and 0s; 1==On and 0==Off */
/* Match the clues given to notate which placement is on or off */
/*r0 = user answer; r1 = game dificulty*/

puzzle_bitmaster:
    cmp r1, #0  /* Checks for player difficulty, 1 = hard or 0 = easy */
    BEQ bit_easy

    bit_hard:
    cmp r0, #8
    BEQ pass
    B fail

    bit_easy:
    cmp r0, #1
    BEQ pass
    B fail


/*       Puzzle 2: Arithmetic Logic           */
/* Solve the mathematic riddles to advance to the next puzzle*/
/*r0 = user answer; r1 = game dificulty*/

puzzle_mathriddle:
    cmp r1, #0  /* Checks for player difficulty, 1 or 0 */
    BEQ math_easy

math_hard:
    cmp r0, #96
    BEQ pass
    B fail

math_easy:
    cmp r0, #36
    BEQ pass
    B fail


/*       Puzzle 3: Guess The Password          */
/* Simply solve the puzzle by guessing the correct password  */
/*r0 = user answer; r1 = game dificulty*/

puzzle_password:
    cmp r0, #7070
    BEQ pass
    B fail


/* Puzzle Results */

pass:
    MOV r0, #1
    BX lr

fail:
    MOV r0, #0
    BX lr