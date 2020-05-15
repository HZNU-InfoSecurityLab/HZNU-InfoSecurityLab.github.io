<div id="player1" class="aplayer"></div>
<script src="/js/src/APlayer.min.js"></script>
<script type="text/javascript">
var ap = new APlayer({
    element: document.getElementById('player1'),                       // Optional, player element
    narrow: false,                                                     // Optional, narrow style
    autoplay: true,                                                    // Optional, autoplay song(s), not supported by mobile browsers
    showlrc: 0,                                                        // Optional, show lrc, can be 0, 1, 2, see: ###With lrc
    mutex: true,                                                       // Optional, pause other players when this player playing
    theme: '#e6d0b2',                                                  // Optional, theme color, default: #b7daff
    mode: 'random',                                                    // Optional, play mode, can be `random` `single` `circulation`(loop) `order`(no loop), default: `circulation`
    preload: 'metadata',                                               // Optional, the way to load music, can be 'none' 'metadata' 'auto', default: 'auto'
    listmaxheight: '513px',                                             // Optional, max height of play list
    music: {                                                           // Required, music info, see: ###With playlist
        title: '你曾是少年',                                          // Required, music title
        author: 'cover',                          // Required, music author
        url: 'http://antiserver.kuwo.cn/anti.s?useless=/resource/&format=mp3&rid=MUSIC_24034501&response=res&type=convert_url&',  // Required, music url
        pic: '/images/visitor.jpg',  // Optional, music picture
    }
});
</script>