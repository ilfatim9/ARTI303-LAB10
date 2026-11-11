% TASK 1

square(Side, Area, Perimeter) :-
    Side > 0,
    Area is Side * Side,
    Perimeter is 4 * Side.

rectangle(Length, Width, Area, Perimeter) :-
    Length > 0,
    Width > 0,
    Area is Length * Width,
    Perimeter is 2 * (Length + Width).

triangle(A, B, C, Area, Perimeter) :-
    A > 0, B > 0, C > 0,
    A + B > C, A + C > B, B + C > A,
    Perimeter is A + B + C,
    S is Perimeter / 2,
    Area is sqrt(S * (S - A) * (S - B) * (S - C)).

% TASK 2

user(admin, admin123).
user(fatimah, 2230003573).
user(ahmed, prolog123).

login :-
    login_attempt(3).

login_attempt(Attempts) :-
    write('Enter username: '),
    read(Username),
    write('Enter password: '),
    read(Password),
    (   atom(Username),
        atomic(Password),
        user(Username, Password)
    ->  write('Login Successful'), nl
    ;   write('Login Unsuccessful'), nl,
        Remaining is Attempts - 1,
        (   Remaining > 0
        ->  login_attempt(Remaining)
        ;   write('Sorry, you exceeded the maximum number of attempts, try again later.'), nl
        )
    ).
