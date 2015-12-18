#lang racket

;{(define (map-reduce {f : (τ → γ)} {l : τ list} {op : (γ * σ → σ)} {init : σ})
;  {(reduce {(map {f : (τ → γ)} {l : τ list}) :  γ list} {op : (γ * σ → σ)} {init : σ}) : σ}) : (τ → γ) * τ list * (γ * σ → σ) * σ → σ}

;{(define (map {f : (τ → γ)} {l : τ list})
;  {(if {(null? {l : τ list}) : bool} {'() : τ list}
;      {(cons {(f {(car {l : τ list}) : τ} : (τ → γ)}) {(map {f : (τ → γ)} {(cdr {l : τ list}) : τ list}) : γ list}) : γ list) : γ list) : (τ → γ) * τ list → γ list}

;{(define (reduce {l : γ list} {op : (γ * σ → σ)} {init : σ})
;  {(if {(null? {l : γ list}) : bool} {init : σ}
;      {(op {(car {l : γ list}) : γ} {(reduce {(cdr {l : γ list}) : γ list} {op : (γ * σ → σ)} {init : σ}) : σ}) : σ) : σ) : γ list * (γ * σ → σ) * σ → σ}