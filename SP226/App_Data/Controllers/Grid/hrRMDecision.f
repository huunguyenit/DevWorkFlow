<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = @@table.ma_dvcs and r.r_new=1))">
]>

<grid table="vhrrmhs" code="ma_hs" order="ma_hs" filter="&FilterCheckAccessUnit;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Cập nhật quyết định tuyển dụng" e="Recruitment Decision"></title>
  <subTitle v="Đợt tuyển dụng: %p - %n..." e="Recruitment Period: %p - %n..."></subTitle>
  <fields>
    <field name="ma_hs" isPrimaryKey="true" width="100" allowFilter="true">
      <header v="Mã ứng viên" e="Candidate ID"></header>
    </field>
    <field name="ten" width="150" allowFilter="true">
      <header v="Họ và tên" e="Full Name"></header>
    </field>
    <field name="ngay_sinh" type="DateTime" dataFormatString="@datetimeFormat" width ="100" allowFilter="true">
      <header v="Ngày sinh" e="Date of Birth"></header>
    </field>
    <field name="noi_sinh" width="300" allowFilter="true">
      <header v="Nơi sinh" e="Place of Birth"></header>
    </field>
    <field name="ten_gt%l" width="60" allowFilter="true">
      <header v="Giới tính" e="Gender"></header>
    </field>
    <field name="ngay_nop" type="DateTime" dataFormatString="@datetimeFormat" width ="100" allowFilter="true">
      <header v="Ngày nộp hồ sơ" e="Date Applied"></header>
    </field>
    <field name="ten_vtr%l" width="150" allowFilter="true">
      <header v="Vị trí ứng tuyển" e="Vacancy"></header>
    </field>
    <field name="ten_bp%l" width="300" allowFilter="true">
      <header v="Bộ phận ứng tuyển" e="Department Applied"></header>
    </field>
    <field name="ten_status%l" width="150" allowFilter="true">
      <header v="Trạng thái hồ sơ" e="Status"></header>
    </field>

    <field name="status" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dot" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vtr" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_lv_dk" type="DateTime" dataFormatString="@datetimeFormat" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_hs"/>
      <field name="ten"/>
      <field name="ngay_sinh"/>
      <field name="noi_sinh"/>

      <field name="ten_gt%l"/>
      <field name="ngay_nop"/>
      <field name="ten_vtr%l"/>
      <field name="ten_bp%l"/>
      <field name="ten_status%l"/>
      <field name="status"/>
      <field name="ma_dot"/>
      <field name="ma_bp"/>
      <field name="ma_vtr"/>
      <field name="ngay_lv_dk"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuwS0fk+C0GAkpp4SO6XBDWI3ql7DXuJJRANskrh2DNWVNYHgzOcYxkMGcOhs9lHmCjzo8aFUq8kGyAfWTcIi7pfVz088bQEfpytnYtGuFyKvSYb8GvJD7enkgShwf7x/BtOzV6Tf7pyrNqSMCgYvwqxk+mojnJa5H451ZklqzNudt4/RpXfne/UDxF8+Bh9NjVHeZb29b6AZbrtvk9OhSf2o88MIA/t2iQhpDgfruE9IEjajJJKUQs2a1GP4dKmU9cTgoei6i4PS0xhH2TVDhKONyv73B/Icyfpp1/128x2d0K02HV5L9uCTQkDU/k/+DLb9DjPIrHPcsKVzCAsHieZqyY/tz+wFvgsFCG6O7b3HAciSntOS33md39dEjc5I1Zj51XoslVG/2hR8rquPIrUThTusou1Yxhfzv4JyiNfr91BmYDI77yxWYh1hNLPInVGTg/9w5X9zbPolrDkznbA=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMDUyYviT+yEVfdZEu4QXOuyMg5uefkRnAy8sMUxNDYXbs6L7LRNNqRjaZ3m2bvk8rqF+OHgVEA1sfvsxn58Ohc=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtSgJAkoMrkkpkyIXR09K8bwHy5tN0rFrKwDiJEMhfSiznDv5hMR5cghdaotyKLob5tNl8amvaiTjS79t97mKmzNIIkmyzmwaxuCTNt+vWweWBCGMaToDfNaIFGc7tzbxyGtVEw420YduWW+ia1rx1HZjXvA7OpSUo1fQxb6xwue/2jhpvQJ2VfmWHlSRIWn90+RCGvO5Vu5v/r4MGpwp+VQHlxpBdQ0wp1OcIKtxB0lKP+2zfu+FFKKo+RlkfqRxzZX5x+4fXq8LkmKofvTMljBokeENGpo7WNHiAEY6NB3Tzg1wbzRqkDQWuakive7Pw+5uwntGAJ5o5PRry1Ejb+HLFSC9bFOCxqpa14Li6cS44tjTs4uNrZMft/REXSEdmA2oT3e//2rxbYq5939lal7VB3ztrqlCUOAl8M8hQIOTJMrnoOKxT3odPmUhfqTRpfz0xBBk4B1GX7wSEdu+KP1qoQUcHPMjPWMWg1wpkkKXk+qtUhrZyjoNOpZ4eIfAiKaCo19KFgkHaZNhVfqGNApuGa3PHNLFYGD0/DwZAmb7fqvB1j/PKCzM8sbXQKStGgwqux6MRwjnKwt8Gl/qBEDZGBAGR82NfgBZktcBQszY1b9Oub+JlShi/GHSV2K0YtY3GmL7sh2klrLf6UHfbOGogpoXR/QRsQlpVe0dQBp6jjVL22u/12tt9uqRUyOy274Do8Ck5zrmdsWy0BAocXuGq2Gen7eE2QZYTA8eVtgH7GrkXI3x55Gj23D88wKjpBPHXVt5fdxvuKSZC8f5o6tJlYzsURheSu5kO2B4MLyuZ0QY2CYKOsygGd27i9ol1ziGexMHSu93bOVGDqf+AQ+dmLKfMwK13yLpsEvKy4/U01sp+vdNSR2pBorSG0V0oAwqqTFpd/gjVKam+ffiTrrZy1bLeNcSO7HpxKI7xcruGs2K06Yg/V1cJXwzGftnrO/px2q7sA8/T4O8mvWy9O5mV6C4avhcolDQuNqDDHN23oAri4j5OKYzi3AUVzxTLg==</Encrypted>]]>
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7H/00cBU+Jp/7A4zk1BvwMshZna4yiqzb4yjNZSxQA9gb6Lxj7dffwjcBvtY7W5QNnF2e2qANGLA8v9Hc+V47p+z+fQn4ccPhEeIYja+jSS7V4Y/4AtI4ih56jsQzH5dT72/zkbAR7q+f2ZpOUCDBwTwo/iUPiVoW3UXGlxU0OvWNUj0mIbYChGSeTBv2xGlIWoGIIcA/NxbQ/magCnBc4=</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="RcrtDecision">
      <title v="Quyết định tuyển dụng$$90" e="Recruitment Decision$$120"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>