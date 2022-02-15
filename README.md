<div id="top"></div>

[![Contributors][contributors-shield]][contributors-url] [![Forks][forks-shield]][forks-url] [![Stargazers][stars-shield]][stars-url] [![Issues][issues-shield]][issues-url] [![MIT License][license-shield]][license-url]

<br />

<div align="center">
  <a href="https://github.com/mporexyz/bread">
    <img src="https://i.imgur.com/qCGPXol.png" alt="Logo" width="128">
  </a>

  <h3 align="center">Bread</h3>

  <p align="center">
    A simple, FOS and dependency-free operating system made in Assembly x86 and C.
    <br />
    <a href="https://mpore.xyz/bread/">Website</a>
    ·
    <a href="https://github.com/mporexyz/bread/issues">Report Bug(s)</a>
  </p>

</div>

<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about">About</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#building">Building</a></li>
      </ul>
    </li>
    <li><a href="#why">Why Bread?</a></li>
      <ul>
        <li><a href="#name">Name</a></li>
        <li><a href="#mascot">Mascot</a></li>
      </ul>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
  </ol>
</details>



## About

Bread is a simple, free and open source and dependency-free operating system made by the Mpore (mpore.xyz) team.

Right now, Bread is a work-in-progress project and can't nor should be used as a professional enviroment.

If ever needed, the suggested codename for Bread is `br-x86`.

### Built With

* Assembly x86 (Intel syntax)
* C

<p align="right">(<a href="#top">back to top</a>)</p>

## Getting Started

To set up Bread in a virtual machine, you could run `qemu` (QEMU™) with the `bread_os.bin` binary file `nasm` outputs when compiling Bread as suggested with the Makefile, however, there's an instruction in Makefile so you can create a `.iso` image to run Bread on other virtual machine supervisors such as Virtualbox™ or VMWare™ or bare-metal.

### Prerequisites

* `nasm`
* `gcc`
* `i686-elf-gcc` (or any cross-compiler) (1)
* `make`
* `qemu` (QEMU™), not required but highly recommended

**1:** In case of using any other compiler that is not 1686-elf-gcc, you'll have to modify the Makefile

### Building

1. Install the required software listed in <a href="#prerequisites">prerequisites</a>.
2. Clone the repo
   ```sh
   git clone https://github.com/mporexyz/bread.git
   ```
3. Run `make`
   ```sh
   make
   ```
4. (Optional) Additional to building, you can make an ISO image.
   ```sh
   make iso
   ```

<p align="right">(<a href="#top">back to top</a>)</p>



## Why Bread?

### Name

Bread is a meaningful name for the team leader and project's creator, Ulises Viña. As he wanted to create an OS at the very young age of 9. And so, made a Batch script that simulated a shell of a full OS.

### Mascot

Toot, the mascot of Bread was chosen because ducks are usually fed with bread.

_For more information, please refer to the [Official Website](https://mpore.xyz/bread)_

<p align="right">(<a href="#top">back to top</a>)</p>

## Roadmap

- [ ] Official Website
- [ ] Add changelog
- [x] Functioning bootloader
- [ ] Functioning kernel
- [ ] Porting standard *commonly used* libraries.
    - [ ] stdio
    - [ ] stdlib
    - [ ] stdint
    - [ ] math
    - [ ] time
- [ ] Filesystem

See the [open issues](https://github.com/mporexyz/bread/issues) for a full list of known issues.

<p align="right">(<a href="#top">back to top</a>)</p>



## Contributing

Contributing to Bread is very easy and appreciated. Here are the instructions on how to do so

1. Fork the project
2. Create your changes branch (`git checkout -b changes/Feature`)
3. Commit your changes (`git commit -m 'Added bugs'`)
4. Push to the branch (`git push origin changes/Feature`)
5. Open a Pull Request (<a href="https://github.com/mporexyz/bread/pulls">Here</a>)

<p align="right">(<a href="#top">back to top</a>)</p>

## License

Distributed under the GPL-3.0 License. See `LICENSE` for more information.

<p align="right">(<a href="#top">back to top</a>)</p>

[contributors-shield]: https://img.shields.io/github/contributors/mporexyz/bread?style=for-the-badge
[contributors-url]: https://github.com/mporexyz/bread/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/mporexyz/bread?style=for-the-badge
[forks-url]: https://github.com/mporexyz/bread/network/members
[stars-shield]: https://img.shields.io/github/stars/mporexyz/bread?style=for-the-badge
[stars-url]: https://github.com/mporexyz/bread/stargazers
[issues-shield]: https://img.shields.io/github/issues/mporexyz/bread?style=for-the-badge
[issues-url]: https://github.com/mporexyz/bread/issues
[license-shield]: https://img.shields.io/github/license/mporexyz/bread?style=for-the-badge
[license-url]: https://github.com/mporexyz/bread/blob/master/LICENSE
