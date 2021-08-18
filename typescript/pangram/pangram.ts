
const allChars = new Set('abcdefghijklmnopqrstuvwxyz'.split(''))

const setDifference = (a: Set<string>, b: Set<string>) => new Set(Array.from(a).filter(item => !b.has(item)))

export default class Pangram {
    private chars: Set<string>
    constructor(input: string) {
        this.chars = new Set(input.toLowerCase().split(''))
    }

    isPangram(): boolean {
        return setDifference(allChars, this.chars).size === 0
    }
}