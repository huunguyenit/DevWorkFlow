<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" code="ma_dvcs, ma_ct, ngay_ct, so_ct, stt_rec" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Xác nhận thanh toán hóa đơn" e="E-invoice Payment Confirmation"></title>
  <subTitle v="Đơn vị %u1 - %u2, ngày chứng từ từ %d1 đến %d2, chứng từ %s1 - %s2..." e="Unit %u1 - %u2, Voucher Date from %d1 to %d2, Voucher %s1 - %s2..."></subTitle>
  <fields>
    <field name="tag" type="Boolean" width="60" filterSource="Tag">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJbtHo3Q0hC+ZW+BSt29RDWP80Vcedfyf9uv/1yggap7nO4MFdA1VF5YBLaFiF/rXPQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ngay_ct" type="DateTime" width="80" readOnly="true" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true">
      <header v="Ngày ct" e="Invoice Date"></header>
    </field>
    <field name="so_ct" width="80" readOnly="true" align="right" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'" allowSorting="true" allowFilter="true">
      <header v="Số ct" e="Invoice Number"></header>
    </field>
    <field name="so_ct_hddt" width="80" readOnly="true" align="right" maxLength="-100" allowSorting="true" allowFilter="true">
      <header v="Số xác thực" e="Reference Number"></header>
    </field>
    <field name="so_seri_hddt" width="80" readOnly="true" clientDefault="Default" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" allowSorting="true" allowFilter="true">
      <header v="Ký hiệu" e="Serial Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ma_kh" width="100" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Mã khách" e="Customer ID"></header>
    </field>
    <field name="ten_kh" width="300" external="true" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Tên khách" e="Customer Name"></header>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" readOnly="true" allowSorting="true" allowFilter="&GridReportAllowFilter.Number;">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nt" width="80" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Mã nt" e="Currency"></header>
    </field>
    <field name="tinh_trang" width="150" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Trạng thái" e="Status"></header>
    </field>

    <field name="ma_dvcs" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_ct" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="chuoi_ngay" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="tag"/>
      <field name="ma_dvcs"/>
      <field name="ngay_ct"/>
      <field name="so_ct"/>
      <field name="so_ct_hddt"/>
      <field name="so_seri_hddt"/>
      <field name="ma_kh"/>
      <field name="ten_kh"/>
      <field name="tien_nt"/>
      <field name="ma_nt"/>
      <field name="tinh_trang"/>
      <field name="stt_rec"/>
      <field name="ma_ct"/>
      <field name="chuoi_ngay"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75/EahnzGYvvNTqUk1gyEjdHqT5Nsjp1o9PP/uPSeMZdsK8TI8F3cJh6ZIHHnSGikGOnoHUZT7wLF4KxGqsTrTsEb9Wdpos++R6mayFi971C0/gLbytRohIbut3cBpg+XuAjlwp5OXQ5JCpaUxiL08vnxJhTJsl/vEvb8sdVmJsVPFt2cNeIGOV+1vYkXSr9iLA==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL758FqqnKB3SEYOg/Qz+yjr8h3tT+3qw3HwDrw8v9yB6FvcuzdSR9Q5G7mwrshy1v9YVNj++5xekz36uWCKUGBg6QShbn1VwcdyieNzMEpBHb5</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75ymtyW99MDOuhUekZt9uT78ikk9b1xhrsXTzfCswY+SnbvrIz671oYMgyYnTPfuMCKzOZP1qQjwtmRd+NOBvMmg=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtenNOeW6DuWlRFZlj7oUHXiVy4zpuK5p2/dl/dQhgl3mxjW+uxYdYrx3+7C/JdbzjYzJzzW5BQHF70st+8gm+U3vHyMkvTaj/cMOmsAfBC9eL4bP7XBbrypzOB3GujfmDCBGSqBF25OAss6n50guSbcpAFsT16kNgepeMGvQD+dc/PgQhWtyLB3PpVoYtcQf9mrX+FgWuN9dNIq9cQWMNsM/iDj1ERhKE17V3SEjNtqqhU/ngDLrINVF/fV3NpBI4Sc8vLSfA/KlqfXpVoMsExD+3A2ElcDigXXmYoG26tob7jJLn6usii/pc/AqZwDuqfCnyUPQ4L7INdn3fjVU51ceLKsFLpuGCkUsIzyAhkBczX7WtJBNbg5xEt1L43E+lGvoJZmBqrEnmDv21IebMx+TeSVKnh8W19lpqj/3wgCa8dtXQqUciDQvadkhkpRtWzHp4KmTC/cZ/52gJIHnSVoBPSx4GM58SDKd/d9+gHHMeKzS1tjYaT9KU8U3q96cqW3G5ohcAmJR0o7riAIaaufwlvP800BH6SxP7WbQ6w2iislYbcFxyc3q99IkgNyC2bNh8s3p7rpPaERL9Nk2qYf3FyZWrk9vPSaQDFcWvlxgoaXMds5WI8thh4VwGGPCKBSLD2kHvvDdbsX43FEIN8bktYlN810ZYqFcvwM5yhT9SvGLKvxZBO3DLnHtAad+HMoQcxQg2EkWpSDB0DZsfx0yQah5ulQ8K78D3j4tWW/k+IcI49WnkvmPjC5lx58Er4QkmWYWO2XvrKFGQhXccfCcx91UYQJJeUhldLZA3IFzYVieSuCPJREZkIRLMGtuewz+fadoZhFKp7aFO5ei2yKj4cuc1wSAaOnDqqCG5bDsGx47kB26jMQECS43xTbABHn6CqZzy1aVuY4/AiKW3+IFlcAyGziX19urigPl9po+vDn7hrIv3TeyeQVWM6ZzAAmDTcPoknv/GlZDWY6gZDx0rsnIvQWcGqvsd5voL6XMAhb+BRe/RfT8DhhSrQkKbeb7wG5RjbvaJLVsAyVCEkn5Lzowpv0rtvUXwiGj1F4fFch0Mg226IhnY3cKy6UoCNKevf4dzPBgjwmClnr71zz5LFgUdj/7C7yUZPECXRMMmz7WVlrmz4my+tuLim02vPVb8FoVm2Dh+AEjSFD1ouoAGU/5/AMFr6mtXoSOVbnzX5PCGLtzkybhqOcNGno1FC6CSZeeXj/0QsCSqTrDYc3e85/+EwZzCXhLmU8OgOICtBmxevXxF1XeB/otTnkrirWp4XJEmCphD3TElK82/lO5aMY9KCcDw2G1dJyAyb6DECXPX2Atk5rQacYSPDDbGnsMojnlBUbOvRV5HeJkC3QqiKJB0fa1kYaA8YcODuCpKz0OKGUfukeSTedby0lfxx3BHarFfRQwneqj9ilgpmfaPMkswH/KavDpwZFdxKPmGIWBUUvEOZbucHYGzASZ77l6VLJZhZr1FuTw356vEO0C/i78KkJLxI2EmoECUZyHj21VTqENlAKyDEAQ28tHvW2mak1e+m4lfvBoF+xatd1SXkPoPr8IIo4iDBm9DGfDdsdqHEXuu6PFmdcxBnKCIhu27Z0TvqeoaIp1sEHUHbDnxUTbMWTb5Pt65xy4ffhbWqOXN5fZWOJTWHOXx0ICjRXicbE3I/tvNxUrGy4QJP/d3ddeH8/nA7ZLU7ccNRvTD6V4rexbovL1zgdJBtzIcx6eQK6MDnisG0EfDSNL8mDiTQBS910wSwE4AYKvCZEIlcPbCRkaYPd5mtw/LZyA0soWFl90ssUVGz77KOpoHTePfNXpSsNowVR87TxiYoVCEioy/WHaxLKxGOBsPKTIVcpHTktClP+rKMN7VrKaVSL0FUM8fH0EiO/o9QQnpYqMprQV6tluAkmFVehWBDfm2P9ULNEQKPOBFfIBQtIbhGVeVjy0ex/zpcVpIgskFkI0DEKIVvYbSZD2Luo4HJ2Wnf+C6MhesjMSIjiVElgyjIOh4A5eMkjF3Ir2Id1LaYFxRWuiBLPI/HZVbWlb0/+j3AgIbCeKtge/Og7U3juVkCJRb8YdPcdfBnETkec4WDzJI81Bvcot1ZsVJevFW2xpH6IeZOo933Kpqn+r4HEDbnZd+GriUavT89uwOEv7vOYJkZ6d4JQnHD234kGk5e8McWwRdQsxO7+SkyHKIS+YyMDOFVhaHvgnCyHepTxGEShub/Quycmy1RQxL3h3V7hLzsO6DnGmTh1TbHgpo6CDnM/Tyj2zngDWEgo+4t7BJ+iyu8clnaeBYcBAfBvRrRj0rPm274aLrmd8vRIaprwQuzrvwUxAxAOEahMhelaxSEx2cnnLcRZvxpEDnnNIHil6YylRcNo7pGR3mbw6wXB+GrMeFISAiEUTtUfxsOTSrKnnuhahaLcQGQ/eAwfIJEBU5qLwvB+pIDbu+ONKfhceNe4pz6PEmkV4jOe7WZfot0r+scP5o93S8URV+pN3V5prC+vk8Dw7vcpeFV2CjEN2CnXpfIR/r4XwTiQDC/fVRg5uUKZmKJKDBZTzXZTLFqH8yvo5i15qD3P2scBogEC1eIR+qN7wSTyIzNhZxkTh0SJOeig8W7XiqOwbnbqRURthdR34XK9vH5xeEAbOS4ix3tJx0KtQsCaYwPZFbNQGoYjqhzVCbKCBEM7bEtNg3cqyMUSvt5RQf0XWEJMOymNRL+XFmH84sXrUuoOXmm9pcPbQVtTrtd8NaVZ0nLMHTfwYhEsXJbpEemcOu03SAw/foKAJIHIKI8FqFAWqv3oDVgOW/JvL0kDgMqX8VSELJPvuzCqLMFQoW97jKL2xiW3FqfENlSX58PRaLKp70CrY3XEtRDYjOA4ARZRn5Cd6ijGIcE6RDf3fTOc9SYVa0tRWyvqYKmNKxWQlVcSH0bKMncaF7rluyU89N2UovFmtUpj7kRHWi7wpAreUyl95rKIczJ4=</Encrypted>]]>
      &JavascriptReportInit;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuwrubY+vjYvioKBDqigjtuyUeUoCCfgbvfZiQCUXQUSHW8uoT3s32jS5AGXZ2sQO77E6sIg/rRZ+mcQ7/MCj5JHXqW0jOQV5SgyBg/bcHbE4MyQGwi5G14s9a/m5TwvVDyNGBGkOQu3a/95BMg/V49gSVUxN3pCR5Jjo2TIXDhY1ejxgDiZOJVdkgy9H4947Yw==</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Payment">
      <title v="Xử lý$" e="Process$"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>