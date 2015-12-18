#lang racket


;hw1-3

;{(define (fact {n : int})
;  {(if {(zero? {n : int}) : bool} {1 : int} {(* {n : int} {(fact {(- {n : int} {1 : int}) : int}) : int}) : int}) : int}) : int -> int}

;{(define (strcomb {n : int} {r : int})
;        {(number->string {(/ {(/ {(fact {n : int}) : int} {(fact {(- {n : int} {r : int}) : int}) : int}) {(fact {r : int}) : int}) : int}) : string}) : int -> string}
                                  
;{(define (nthraw {n : int} {r : int})
;  {(if {(zero? {n : int}) : bool} {"1" : string}
;      {(if {(equal? {n : int} {r : int}) : bool} {(strcomb {n : int} {r : int}) : string} {(string-append {(strcomb {n : int} {r : int}) : string} {(nthraw {n : int} {(+ {r : int} {1 : int}) : int}) : string}) : string}) : string}) : string}) : int * int -> string}

;{(define {(yanghui {n : int})
;  {(if {(zero? {n : int}) : bool} {"" : string}
;      {(string-append {(yanghui {(- {n : int} {1 : int}) : int}) : string} {(nthraw {(- {n : int} {1 : int}) : int} {0 : int}) : string}) : string}) : string}) : int -> string}

;hw1-5

;{(define (firstl {l : τ list})
;  {(if {(null? {l : τ list}) : bool} {'() : τ list}
;      {(if {(null? {(car {l : τ list}) : τ}) : bool} {(firstl {(cdr {l : τ list}) : τ list}) : τ list}
;          {(append {(list {(car {(car {l : τ list}) : τ list}) τ}) : τ list} {(firstl {(cdr {l : τ list}) : τ list}) : τ list}) : τ list}) : τ list}) : τ list}) : τ list -> τ list}

;{(define (lastl {l : τ list})
;  {(if {(null? {l : τ list}) : bool} {'() : τ list}
;      {(if {(null? {(car {l : τ list}) : τ}) : bool} {(lastl {(cdr {l : τ list}) : τ list}) : τ list}
;          {(append {(list {(cdr {(car {l : τ list}) : τ list}) : τ}) : τ list} {(lastl {(cdr {l : τ list}) : τ list}) : τ list}) : τ list}) : τ list}) : τ list}) : τ list -> τ list}

;{(define (zipperN {l : τ list})
;  {(if {(null? {l : τ list}) : bool} {'() : τ list}
;      {(append {(firstl {l : τ list}) : τ list} {(zipperN {(lastl {l : τ list}) : τ list}) : τ list}) : τ list}) : τ list}) : τ list -> τ list}

;hw1-6

;{(define (crazy2val {c : Crazy-2})
;  {(cond
;    {({(equal? {c : Crazy-2} {'z : Crazy-2}) : bool} {0 : int}) : int}
;    {({(equal? {c : Crazy-2} {'p : Crazy-2}) : bool} {1 : int}) : int}
;    {({(equal? {c : Crazy-2} {'n : Crazy-2}) : bool} {-1 : int}) : int}
;    {(else {(cond {({(equal? {(car {c : Crazy-2}) : Crazy-2} {'z : Crazy-2}) : bool} {(* {2 : int} {(crazy2val {(cdr {c : Crazy-2}) : Crazy-2}) : int}) : int) : int}
;                {({(equal? {(car {c : Crazy-2}) : Crazy-2} {'p : Crazy-2}) : bool} {(+ {1 : int} {(* 2 {(crazy2val {(cdr {c : Crazy-2}) : Crazy-2}) : int}) : int}) : int}) : int}
;                {({(equal? {(car {c : Crazy-2}) : Crazy-2} {'n : Crazy-2}) : bool} {(+ {-1 : int} {(* {2 : int} {(crazy2val {(cdr {c : Crazy-2}) : Crazy-2}) : int}) : int}) : int}) : int}) : int}) : int}) : int}) : Crazy-2 -> int}

;hw2-1

;{(define (leaf {n : τ})
;  {(cons {'leaf : symbol} {n : τ}) : τ tree}) : τ → τ tree}

;{(define (node {l : (τ tree) list})
;  {l : τ tree}) : (τ tree) list -> τ tree}

;{(define (is-leaf? {t : τ tree})
;  {(equal? {(car {t : τ tree}) : τ} {'leaf : symbol}) : bool}) : τ tree -> bool}

;{(define (leaf-val {t : τ tree})
;  {(cdr {t : τ tree}) : τ}) : τ tree -> τ}

;{(define (nth-child {t : τ tree} {n : int})
;  {(if {(zero? {n : int}) : bool} {(car {t : τ tree}) : τ} {(nth-child {(cdr {t : τ tree}) : τ tree} {(- {n : int} {1 : int}) : int}) : τ}) : τ}) : τ tree * int -> τ

;hw2-2

;{(define (model {n : nat})
;  {(leaf {n : nat}) : mobile}) : nat -> mobile}

;{(define (make-branch {n : nat} {m : mobile})
;  {(node {(list {(leaf {n : nat}) : mobile} {m : mobile}) : list}) : branch}) : nat * mobile -> branch}

;{(define (make-mobile {b1 : branch} {b2 : branch})
;  {(node {(list {b1 : branch} {b2 : branch}) : list}) : mobile}) : branch * branch -> mobile}

;{(define (weight {m : mobile})
;  {(if {(is-leaf? {m : mobile}) : bool} {(leaf-val {m : mobile}) : nat}
;      {(if {(is-leaf? {(car {(cdr {m : mobile}) : mobile}) : mobile}) : bool} {(leaf-val {(car {(cdr {m : mobile}) : mobile}) : mobile}) : nat}
;          {(if {(is-leaf? {(car {m : mobile}) : mobile}) : bool} {(weight {(car {(cdr {m : mobile}) : mobile}) : mobile}) : nat} {(+ {(weight {(car {m : mobile}) : mobile}) : nat} {(weight {(car {(cdr {m : mobile}) : mobile}) : mobile}) : nat}) : nat}) : nat}) : nat}) : nat}) : mobile -> nat}

;{(define (is-balanced? {m : mobile})
;  {(if {(is-leaf? {m : mobile}) : bool} {#t : bool}
;      {(if {(and {(is-leaf? {(car {(cdr {(car {m : mobile}) : mobile}) : mobile}) : mobile}) : bool} {(is-leaf? {(car {(cdr {(car {(cdr {m : mobile}) : mobile}) : mobile}) : mobile}) : mobile}) : bool}) : bool} {(equal? {(* {(leaf-val {(car {(car {m : mobile}) : mobile}) : mobile}) : nat} {(weight {(car {m : mobile}) : mobile}) : nat}) : nat} {(* {(leaf-val {(car {(car {(cdr {m : mobile}) : mobile}) : mobile}) : mobile}) : nat} {(weight {(car {(cdr {m : mobile}) : mobile}) : mobile}) : nat}) : nat}) : bool}
;          {(if {(is-leaf? {(car {(cdr {m : mobile}) : mobile}) : mobile}) : bool} {(is-balanced? {(car {(cdr {m : mobile}) : mobile}) : mobile}) : bool} {(is-balanced? {(car {(cdr {(car {m : mobile}) : mobile}) : mobile}) : mobile}) : bool}) : bool}) : bool}) : bool}) : mobile -> bool}

;hw2-3

;{(define zero
;  {(leaf 0) : circuit}) : circuit}

;{(define one
;  {(leaf 1) : circuit}) : circuit}

;{(define (not-circuit {c : circuit})
;  {(if {(equal? {c : circuit} {(leaf 0) : circuit}) : bool} {(node {(list {(leaf 1) : circuit} {c : circuit}) : circuit}) : circuit}
;      {(if {(equal? {c : circuit} {(leaf 1) : circuit}) : bool} {(node {(list {(leaf 0) : circuit} {c : circuit}) : circuit}) : circuit}
;          {(if {(equal? {(car {c : circuit}) : circuit} {(leaf 0) : circuit}) : bool} {(node {(list {(leaf 1) : circuit} {c : circuit}) : circuit}) : circuit} {(node {(list {(leaf 0) : circuit} {c : circuit}) : circuit}) : circuit}) : circuit}) : circuit}) : circuit}) : circuit -> circuit}

;{(define (add1 {c1 : circuit} {c2 : circuit})
;  {(node {(list {(leaf 1) : circuit} {c1 : circuit} {c2 : circuit}) : circuit}) : circuit}) : circuit * circuit -> circuit}

;{(define (add0 {c1 : circuit} {c2 : circuit})
;  {(node {(list {(leaf 0) : circuit} {c1 : circuit} {c2 : circuit}) : circuit}) : circuit}) : circuit * circuit -> circuit}

;{(define (and-circuit {c1 : circuit} {c2 : circuit})
;  {(cond
;    {({(and {(is-leaf? {c1 : circuit}) : bool} {(is-leaf? {c2 : circuit}) : bool}) : bool}
;     {(if {(and {(equal? {(leaf-val {c1 : circuit}) : int} {1 : int}) : bool} {(equal? {(leaf-val {c2 : circuit}) : int} {1 : int}) : bool}) : bool} {(add1 {c1 : circuit} {c2 : circuit}) : circuit} {(add0 {c1 : circuit} {c2 : circuit}) : circuit}) : circuit}) : circuit}
;    {({(is-leaf? {c1 : circuit}) : bool}
;     {(if {(and {(equal? {(leaf-val {c1 : circuit}) : int} {1 : int}) : bool} {(equal? {(leaf-val {(car {c2 : circuit}) : circuit}) : int} {1 : int}) : bool}) : bool} {(add1 {c1 : circuit} {c2 : circuit}) : circuit} {(add0 {c1 : circuit} {c2 : circuit}) : circuit}) : circuit}) : circuit}
;    {({(is-leaf? {c2 : circuit}) : bool}
;     {(if {(and {(equal? {(leaf-val {(car {c1 : circuit}) : circuit}) : int} {1 : int}) : bool} {(equal? {(leaf-val {c2 : circuit}) : int} {1 : int}) : bool}) : bool} {(add1 {c1 : circuit} {c2 : circuit}) : circuit} {(add0 {c1 : circuit} {c2 : circuit}) : circuit}) : circuit}) : circuit}
;    {(else
;     {(if {(and {(equal? {(leaf-val {(car {c1 : circuit}) : circuit}) : int} {1 : int}) : bool} {(equal? {(leaf-val {(car {c2 : circuit}) : circuit}) : int} {1 : int}) : bool}) : bool} {(add1 {c1 : circuit} {c2 : circuit}) : circuit} {(add0 {c1 : circuit} {c2 : circuit}) : circuit}) : circuit}) : circuit}) : circuit}) : circuit * circuit -> circuit}

;{(define (or-circuit {c1 : circuit} {c2 : circuit})
;  {(cond
;    {({(and {(is-leaf? {c1 : circuit}) : bool} {(is-leaf? {c2 : circuit}) : bool}) : bool}
;     {(if {(and {(equal? {(leaf-val {c1 : circuit}) : int} {0 : int}) : bool} {(equal? {(leaf-val {c2 : circuit}) : int} {0 : int}) : bool}) : bool} {(add0 {c1 : circuit} {c2 : circuit}) : circuit} {(add1 {c1 : circuit} {c2 : circuit}) : circuit}) : circuit}) : circuit}
;    {({(is-leaf? {c1 : circuit}) : bool}
;     {(if {(and {(equal? {(leaf-val {c1 : circuit}) : int} {0 : int}) : bool} {(equal? {(leaf-val {(car {c2 : circuit}) : circuit}) : int} {0 : int}) : bool}) : bool} {(add0 {c1 : circuit} {c2 : circuit}) : circuit} {(add1 {c1 : circuit} {c2 : circuit}) : circuit}) : circuit}) : circuit}
;    {({(is-leaf? {c2 : circuit}) : bool}
;     {(if {(and {(equal? {(leaf-val {(car {c1 : circuit}) : circuit}) : int} {0 : int}) : bool} {(equal? {(leaf-val {c2 : circuit}) : int} {0 : int}) : bool}) : bool} {(add0 {c1 : circuit} {c2 : circuit}) : circuit} {(add1 {c1 : circuit} {c2 : circuit}) : circuit}) : circuit}) : circuit}
;    {(else
;     {(if {(and {(equal? {(leaf-val {(car {c1 : circuit}) : circuit}) : int} {0 : int}) : bool} {(equal? {(leaf-val {(car {c2 : circuit}) : circuit}) : int} {0 : int}) : bool}) : bool} {(add0 {c1 : circuit} {c2 : circuit}) : circuit} {(add0 {c1 : circuit} {c2 : circuit}) : circuit}) : circuit}) : circuit}) : circuit}) : circuit * circuit -> circuit}

;{(define (is-zero? {c : circuit})
;  {(if {(is-leaf? {c : circuit}) : bool}
;      {(if {(zero? {(leaf-val {c : circuit}) : int}) : bool} {#t : bool} {#f : bool}) : bool} {#f : bool}) : bool}) : circuit -> bool}

;{(define (is-one? {c : circuit})
;  {(if {(is-leaf? {c : circuit}) : bool}
;      {(if {(zero? {(leaf-val {c : circuit}) : int}) : bool} {#f : bool} {#t : bool}) : bool} {#f : bool}) : bool}) : circuit -> bool}

;{(define (length {l : circuit})
;  {(if {(null? {l : circuit}) : bool} {0 : int} {(+ 1 {(length {(cdr {l : circuit}) : circuit}) : int}) : int}) : int}) : circuit -> int}

;{(define (is-not? {c : circuit})
;  {(equal? {(length {c : circuit}) : int} {2 : int}) : bool}) : circuit -> bool}

;{(define (is-and? {c : circuit})
;  {(if {(equal? {(length {c : circuit}) : int} {3 : int}) : bool}
;      {(cond
;        {({(and {(is-leaf? {(car {(cdr {c : circuit}) : circuit}) : circuit}) : bool} {(is-leaf? {(car {(cdr {(cdr {c : circuit}) : circuit}) : circuit}) : circuit}) : bool}) : bool} {(if {(equal? {(car {c : circuit}) : circuit} {(and {(car {(cdr {c : circuit}) : circuit}) : circuit} {(car {(cdr {(cdr {c : circuit}) : circuit}) : circuit}) : circuit}) : circuit}) : bool} {#t : bool} {#f : bool}) : bool}) : bool}
;        {({(is-leaf? {(car {(cdr {c : circuit}) : circuit}) : circuit}) : bool} {(if {(equal? {(car {c : circuit}) : circuit} {(and {(car {(cdr {c : circuit}) : circuit}) : circuit} {(car {(car {(cdr {(cdr {c : circuit}) : circuit}) : circuit}) : circuit}) : circuit}) : circuit}) : bool} {#t : bool} {#f : bool}) : bool}) : bool}
;        {({(is-leaf? {(car {(cdr {(cdr {c : circuit}) : circuit}) : circuit}) : circuit}) : bool} {(if {(equal? {(car {c : circuit}) : circuit} {(and {(car {(car {(cdr {c : circuit}) : circuit}) : circuit}) : circuit} {(car {(cdr {(cdr {c : circuit}) : circuit}) : circuit}) : circuit}) : circuit}) : bool} {#t : bool} {#f : bool}) : bool}) : bool}
;        {(else {(if {(equal? {(car {c : circuit}) : circuit} {(and {(car {(car {(cdr {c : circuit}) : circuit}) : circuit}) : circuit} {(car {(car {(cdr {(cdr {c : circuit}) : circuit}) : circuit}) : circuit}) : circuit}) : circuit}) : bool} {#t : bool} {#f : bool}) : bool}) : bool}) : bool} {#f : bool}) : bool}) : circuit -> bool}

;{(define (is-or? {c : circuit})
;  {(if {(equal? {(length {c : circuit}) : int} {3 : int}) : bool}
;      {(cond
;        {({(and {(is-leaf? {(car {(cdr {c : circuit}) : circuit}) : circuit}) : bool} {(is-leaf? {(car {(cdr {(cdr {c : circuit}) : circuit}) : circuit}) : circuit}) : bool}) : bool} {(if {(equal? {(car {c : circuit}) : circuit} {(or {(car {(cdr {c : circuit}) : circuit}) : circuit} {(car {(cdr {(cdr {c : circuit}) : circuit}) : circuit}) : circuit}) : circuit}) : bool} {#t : bool} {#f : bool}) : bool}) : bool}
;        {({(is-leaf? {(car {(cdr {c : circuit}) : circuit}) : circuit}) : bool} {(if {(equal? {(car {c : circuit}) : circuit} {(or {(car {(cdr {c : circuit}) : circuit}) : circuit} {(car {(car {(cdr {(cdr {c : circuit}) : circuit}) : circuit}) : circuit}) : circuit}) : circuit}) : bool} {#t : bool} {#f : bool}) : bool}) : bool}
;        {({(is-leaf? {(car {(cdr {(cdr {c : circuit}) : circuit}) : circuit}) : circuit}) : bool} {(if {(equal? {(car {c : circuit}) : circuit} {(or {(car {(car {(cdr {c : circuit}) : circuit}) : circuit}) : circuit} {(car {(cdr {(cdr {c : circuit}) : circuit}) : circuit}) : circuit}) : circuit}) : bool} {#t : bool} {#f : bool}) : bool}) : bool}
;        {(else {(if {(equal? {(car {c : circuit}) : circuit} {(or {(car {(car {(cdr {c : circuit}) : circuit}) : circuit}) : circuit} {(car {(car {(cdr {(cdr {c : circuit}) : circuit}) : circuit}) : circuit}) : circuit}) : circuit}) : bool} {#t : bool} {#f : bool}) : bool}) : bool}) : bool} {#f : bool}) : bool}) : circuit -> bool}

;{(define (sub-circuit {c : circuit} {n : nat})
;  {(if {(zero? {n : nat}) : bool} {(car {(cdr {c : circuit}) : circuit}) : circuit} {(car {(cdr {(cdr {c : circuit}) : circuit}) : circuit}) : circuit}) : circuit}) : circuit * nat -> circuit}