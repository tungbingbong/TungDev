const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);

const PLAYER_STORAGE_KEY = 'MUSIC_PLAYER';

const playList = $('.playlist');
const player = $('.player');
const heading = $('header h2');
const cdThumb = $('.cd-thumb');
const audio = $('#audio');
const cd = $('.cd');
const playBtn = $('.btn-toggle-play');
const progress = $('#progress');
const nextBtn = $('.btn-next');
const prevBtn = $('.btn-prev');
const randomBtn = $('.btn-random');
const repeatBtn = $('.btn-repeat');
const timeLeft = $('.time-left');
const timeRight = $('.time-right');
const volumn = $('.volume');

const app = {
    currentIndex: 0,
    isPlaying: false,
    isRandom: false,
    isRepeat: false,
    config: JSON.parse(localStorage.getItem(PLAYER_STORAGE_KEY)) || {},
    setConfig: function (key, value) {
        this.config[key] = value;
        localStorage.setItem(PLAYER_STORAGE_KEY, JSON.stringify(this.config));
    },
    arrSongs: [],
    songs: [
        {
            id: 1,
            name: 'Cuới thôi',
            singer: 'Bray-Masew',
            path: './assets/songs/Cưới Thôi - Masew x Masiu x B Ray x TAP ( Lyrics Audio ).mp3',
            image: './assets/img/masew.jpg'
        },
        {
            id: 2,
            name: 'Có khi',
            singer: 'Hoài Lâm',
            path: './assets/songs/co-khi.mp3',
            image: './assets/img/hoailam1.jpg'
        },
        {
            id: 3,
            name: 'Hoa nở không màu',
            singer: 'Hoài Lâm',
            path: './assets/songs/hoa-no-khong-mau.mp3',
            image: './assets/img/hoailam2.jpg'
        },
        {
            id: 4,
            name: 'Trộm nhìn nhau',
            singer: 'Hoài Lâm',
            path: './assets/songs/trom-nhin-nhau.mp3',
            image: './assets/img/hoailam1.jpg'
        },
        {
            id: 5,
            name: 'Như những phút ban đầu',
            singer: 'Hoài Lâm',
            path: './assets/songs/nhu-nhung-phut-ban-dau.mp3',
            image: './assets/img/hoailam2.jpg'
        },
        {
            id: 6,
            name: 'Ngày chưa giông bão',
            singer: 'Anh Hảo Vô Cơ',
            path: './assets/songs/KhiAnhQuaThungLung.mp3',
            image: './assets/img/masew.jpg'
        },
        {
            id: 7,
            name: 'You Belong With Me',
            singer: 'Taylor Swift',
            path: './assets/songs/TaylorSwift-YouBelongWithMe.mp3',
            image: './assets/img/taylor.jpg'
        },
        {
            id: 7,
            name: 'I Love You 3000',
            singer: 'Stephanie Poetri',
            path: './assets/songs/[Vietsub . Lyrics] I Love You 3000 - Stephanie Poetri.mp3',
            image: './assets/img/love3000.jpg'
        },
        {
            id: 7,
            name: 'Everything I Need',
            singer: 'Skylar Grey',
            path: './assets/songs/[Vietsub . Lyrics} - Everything I Need - Skylar Grey (Aquaman Soundtrack).mp3',
            image: './assets/img/hoailam2.jpg'
        },
        {
            id: 7,
            name: 'Love Story',
            singer: 'Taylor Swift',
            path: './assets/songs/[Vietsub.Lyrics] Love Story - Taylor Swift.mp3',
            image: './assets/img/taylor.jpg'
        },
        {
            id: 7,
            name: 'Anne-Marie',
            singer: 'Bảo',
            path: './assets/songs/Anne-Marie - 2002 [Official Video].mp3',
            image: './assets/img/hoailam2.jpg'
        },
        {
            id: 7,
            name: 'Thank U, Next',
            singer: 'Ariana Grande',
            path: './assets/songs/Ariana Grande - thank u, next (lyric video).mp3',
            image: './assets/img/hoailam2.jpg'
        },
        {
            id: 7,
            name: 'Wolves',
            singer: 'Selena Gomez, Marshmello',
            path: './assets/songs/Selena Gomez, Marshmello - Wolves.mp3',
            image: './assets/img/gomez.jpg'
        }
    ],
    render: function () {
        const htmls = this.songs.map((song, index) => { // this là object app
            return `
        <div class="song${this.currentIndex === index ? ' active' : ''}"  data-index="${index}">
            <div class="thumb"
                style="background-image: url('${song.image}')">
            </div>
            <div class="body">
                <h3 class="title">${song.name}</h3>
                <p class="author">${song.singer}</p>
            </div>
            <div class="option">
                <i class="fas fa-ellipsis-h"></i>
            </div>
        </div>`
        })
        playList.innerHTML = htmls.join('');
    },
    defineProperties: function () {
        Object.defineProperty(this, 'currentSong', {
            get: function () {
                return this.songs[this.currentIndex];
            }
        })
    },
    handleEvents: function () {
        const cdWidth = cd.offsetWidth;

        // Xử lý cd quay và dừng
        const cdThumbAnimate = cdThumb.animate([
            { transform: 'rotate(360deg)' }
        ], {
            duration: 100000,
            iterations: Infinity
        });
        cdThumbAnimate.pause();

        // Xử lý phóng to/ thu nỏ CD
        document.onscroll = function () {
            const scrollTop = window.scrollY || document.documentElement.scrollTop;
            var newCdWidth = cdWidth - scrollTop;

            newCdWidth = newCdWidth > 0 ? newCdWidth : 0;

            cd.style.width = newCdWidth + 'px';
            // cd.style.opacity = newCdWidth / cdWidth;
        }

        // Xử lý khi click play
        playBtn.onclick = playFunc;

        function playFunc() {
            if (app.isPlaying) {
                audio.pause();
            } else {
                audio.play();
            }

            // song play
            audio.onplay = function () {
                app.isPlaying = true;
                player.classList.add('playing');
                cdThumbAnimate.play();
            }

            // song pause
            audio.onpause = function () {
                app.isPlaying = false;
                player.classList.remove('playing');
                cdThumbAnimate.pause();
            }

            // Khi tiến độ bài hát thay đổi
            audio.ontimeupdate = function () {
                if (audio.duration) {
                    const progressPercent = (audio.currentTime / audio.duration * 100);
                    progress.value = progressPercent;
                    // console.log(progress.value)
                    app.loadTimeLeft()
                }
            }

            // Khi thay đổi âm lượng bài hát
            volumn.oninput = function () {
                audio.volume = this.value / 100;
            }
            // audio.onvolumechange = function () {
            //     volumn
            // }

            // Tua
            progress.oninput = function () {
                audio.currentTime = this.value * audio.duration / 100;
            }

        }

        //next song
        nextBtn.onclick = function () {
            var lastIndex = app.currentIndex;
            app.nextSong();
            playFunc();
            audio.play();
            app.render();
            app.scrollToActiveSong(lastIndex);
        }

        //prev song
        prevBtn.onclick = function () {
            app.prevSong();
            playFunc();
            audio.play();
            app.render();
            app.scrollToActiveSong();
        }

        // random song
        randomBtn.onclick = function () {
            app.isRandom = !app.isRandom;
            randomBtn.classList.toggle('active', app.isRandom);
            app.setConfig('isRandom', app.isRandom)
            console.log(app.isRandom)
        }

        // random song
        repeatBtn.onclick = function () {
            app.isRepeat = !app.isRepeat;
            repeatBtn.classList.toggle('active', app.isRepeat);
            app.setConfig('isRepeat', app.isRepeat)
            console.log(app.isRepeat)
        }

        // Xử lý next song khi audio kết thúc
        audio.onended = function () {
            if (app.isRepeat) {
                app.repeatSong();
            } else {
                // app.nextSong();
                nextBtn.click();
            }
            audio.play();
        }

        // Lắng nghe hành vi click vào playlist
        playList.onclick = function (e) {
            const songEl = e.target.closest('.song:not(.active)');
            const optionEl = e.target.closest('.option');
            // Xử lý khi click vào song
            if (!optionEl) {
                if (songEl) {
                    app.currentIndex = Number(songEl.getAttribute('data-index'));
                    app.loadCurrentSong();
                    playFunc();
                    audio.play();
                    app.render();
                }
            }
            if (optionEl) {
                alert('Nhạc hay thì xin 1 like')
            }
        }
    },
    loadCurrentSong: function () {

        heading.textContent = this.currentSong.name;
        cdThumb.style.backgroundImage = `url('${this.currentSong.image}')`;
        audio.src = this.currentSong.path;
        app.loadTimeRight();

    },
    loadTimeRight: function () {
        audio.onloadedmetadata = function () {
            var timeTotal = Math.floor(audio.duration);
            var minutesRight = Math.floor(timeTotal / 60);
            var secondsRight = timeTotal % 60;
            console.log(timeTotal)
            timeRight.innerText = `${minutesRight < 10 ? "0" + minutesRight : minutesRight}:${secondsRight < 10 ? "0" + secondsRight : secondsRight}`;
        }
    },
    loadTimeLeft: function () {
        var timeTotal = Math.floor(audio.currentTime);
        var minutesRight = Math.floor(timeTotal / 60);
        var secondsRight = timeTotal % 60;
        timeLeft.innerText = `${minutesRight < 10 ? "0" + minutesRight : minutesRight}:${secondsRight < 10 ? "0" + secondsRight : secondsRight}`;
    },
    loadConfig: function () {
        this.isRandom = this.config.isRandom;
        this.isRepeat = this.config.isRepeat;
        randomBtn.classList.toggle('active', app.isRandom);
        repeatBtn.classList.toggle('active', app.isRepeat);

    },
    nextSong: function () {
        if (app.isRandom) {
            app.endRandomSong();
            app.playRandomSong();
        } else {
            this.currentIndex++;
            if (this.currentIndex >= this.songs.length) {
                this.currentIndex = 0;
            }
        }
        console.log('nextBtn: ' + this.currentIndex); // nextBtn:  + this.currentIndex
        this.loadCurrentSong();
    },
    prevSong: function () {
        if (app.isRandom) {
            app.endRandomSong();
            app.playRandomSong();
        } else {
            this.currentIndex--;
            if (this.currentIndex < 0) {
                this.currentIndex = this.songs.length - 1;
            }
        }
        console.log('prevBtn: ' + this.currentIndex); // prevBtn:  + this.currentIndex
        this.loadCurrentSong();
    },
    playRandomSong: function () {
        prevIndex = this.currentIndex;
        do {
            this.currentIndex = Math.floor(Math.random() * this.songs.length);
        } while (app.arrSongs.includes(this.currentIndex))

        this.loadCurrentSong();
    },
    endRandomSong: function () {
        app.arrSongs.push(app.currentIndex);
        if (app.arrSongs.length === app.songs.length) {
            app.arrSongs = [];
        }
    },
    repeatSong: function () {
        this.loadCurrentSong();
    },
    scrollToActiveSong: function (lastIndex) {
        setTimeout(() => {
            console.log('lastIndex: ' + lastIndex)
            $('.song.active').scrollIntoView({
                behavior: 'smooth',
                block: 'center'
            });
        }, 100)
    },
    start: function () {
        // Gán cấu hình từ config vào app
        this.loadConfig()

        // Định nghĩa các thuộc tính cho object
        this.defineProperties()

        // Lắng nghe / xử lý các sự kiện
        this.handleEvents()

        // Tải bài hát đầu tiên
        this.loadCurrentSong()

        // Render playlist
        this.render()
    },
}

app.start();

