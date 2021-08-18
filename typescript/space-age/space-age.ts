
enum SecondsInYear {
    Earth = 31557600,
    Mercury = 0.2408467 * Earth,
    Venus = 0.61519726 * Earth,
    Mars = 1.8808158 * Earth,
    Jupiter = 11.862615 * Earth,
    Saturn = 29.447498 * Earth,
    Uranus = 84.016846 * Earth,
    Neptune = 164.79132 * Earth,
}


const r = (n: number) => Math.round(n*100) / 100;

export default class SpaceAge {
    
    constructor(public seconds: number) {}

    onEarth(): number {
        return r(this.seconds / SecondsInYear.Earth);
    }

    onMercury(): number {
        return r(this.seconds / SecondsInYear.Mercury);
    }

    onVenus(): number {
        return r(this.seconds / SecondsInYear.Venus);
    }

    onMars(): number {
        return r(this.seconds / SecondsInYear.Mars);
    }

    onJupiter(): number {
        return r(this.seconds / SecondsInYear.Jupiter);
    }

    onSaturn(): number {
        return r(this.seconds / SecondsInYear.Saturn);
    }

    onUranus(): number {
        return r(this.seconds / SecondsInYear.Uranus);
    }

    onNeptune(): number {
        return r(this.seconds / SecondsInYear.Neptune);
    }


}