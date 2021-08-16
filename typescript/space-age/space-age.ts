const EARTH_SECONDS_IN_YEAR = 31557600;
const MERCURY_SECONDS_IN_YEAR = 0.2408467 * EARTH_SECONDS_IN_YEAR;
const VENUS_SECONDS_IN_YEAR = 0.61519726 * EARTH_SECONDS_IN_YEAR;
const MARS_SECONDS_IN_YEAR = 1.8808158 * EARTH_SECONDS_IN_YEAR;
const JUPITER_SECONDS_IN_YEAR = 11.862615 * EARTH_SECONDS_IN_YEAR;
const SATURN_SECONDS_IN_YEAR = 29.447498 * EARTH_SECONDS_IN_YEAR;
const URANUS_SECONDS_IN_YEAR = 84.016846 * EARTH_SECONDS_IN_YEAR;
const NEPUTE_SECONDS_IN_YEAR = 164.79132 * EARTH_SECONDS_IN_YEAR;

const r = (n: number) => Math.round(n*100) / 100;

export default class SpaceAge {
    seconds: number;

    constructor(seconds: number) {
        this.seconds = seconds;
    }

    onEarth(): number {
        return r(this.seconds / EARTH_SECONDS_IN_YEAR);
    }

    onMercury(): number {
        return r(this.seconds / MERCURY_SECONDS_IN_YEAR);
    }

    onVenus(): number {
        return r(this.seconds / VENUS_SECONDS_IN_YEAR);
    }

    onMars(): number {
        return r(this.seconds / MARS_SECONDS_IN_YEAR);
    }

    onJupiter(): number {
        return r(this.seconds / JUPITER_SECONDS_IN_YEAR);
    }

    onSaturn(): number {
        return r(this.seconds / SATURN_SECONDS_IN_YEAR);
    }

    onUranus(): number {
        return r(this.seconds / URANUS_SECONDS_IN_YEAR);
    }

    onNeptune(): number {
        return r(this.seconds / NEPUTE_SECONDS_IN_YEAR);
    }


}