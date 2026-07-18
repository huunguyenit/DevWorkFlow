<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;

  <!ENTITY ScriptInsertRetrieveItems SYSTEM "..\Include\Javascript\InsertRetrieveItems.txt">
  <!ENTITY ScriptEmptyExternalField SYSTEM "..\Include\Javascript\EmptyExternalField.txt">
  <!ENTITY Controller "S5Detail">
  <!ENTITY Code "SF5">
]>

<grid table="ds5$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="SF5" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="cs5$000000" prime="ds5$" inquiry="is5$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

  <fields>
    <field name="ma_px" width="100" aliasName="a" readOnly="true">
      <header v="Phân xưởng" e="Shop"></header>
    </field>
    <field name="ten_px%l" readOnly="true" width="0" hidden="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_lsx" width="100" aliasName="a" readOnly="true">
      <header v="Yêu cầu sản xuất" e="Work Order"></header>
    </field>
    <field name="ten_lsx%l" readOnly="true" width="0" hidden="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_cd" width="100" aliasName="a" readOnly="true">
      <header v="Công đoạn" e="Operation"></header>
    </field>
    <field name="ten_cd%l" readOnly="true" width="0" hidden="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_vt" width="100" aliasName="a" readOnly="true">
      <header v="Bán thành phẩm" e="WIP"></header>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="b">
      <header v="Tên bán thành phẩm" e="WIP Description"></header>
    </field>

    <field name="dvt" width="50" aliasName="a" readOnly="true">
      <header v="Đvt" e="UOM"></header>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="he_so" type="Decimal" width="0" inactivate="true" hidden="true" dataFormatString="&CoefficientInputFormat;" clientDefault="0">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_lo" width="80" aliasName="a" readOnly="true">
      <header v="Mã lô" e="Lot"></header>
    </field>
    <field name="ten_lo%l" readOnly="true" external="true" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80" readOnly="true">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>

    <field name="sl_duyet" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80">
      <header v="Sl duyệt" e="Passed Quantity"></header>
      <items style="Numeric"/>
    </field>

    <field name="sl_hong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80">
      <header v="Sl hỏng" e="Reject Quantity"></header>
      <items style="Numeric"/>
    </field>

    <field name="sl_lam_lai" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80">
      <header v="Sl làm lại" e="Rework Quantity"></header>
      <items style="Numeric"/>
    </field>

    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
      <handle key="[nhieu_dvt = 1]" field="ma_vt"/>
    </field>
    <field name="lo_yn" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>
    <field name="tao_lo" type="Boolean" width="0" external="true" hidden="true" aliasName="b">
      <header v="" e=""></header>
    </field>

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="stt_rec_gd" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0gd" readOnly="true" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_px"/>
      <field name="ten_px%l"/>
      <field name="ma_lsx"/>
      <field name="ten_lsx%l"/>
      <field name="ma_cd"/>
      <field name="ten_cd%l"/>

      <field name="ma_vt"/>
      <field name="ten_vt%l"/>
      <field name="dvt"/>
      <field name="ten_dvt%l"/>
      <field name="he_so"/>
      <field name="ma_lo"/>
      <field name="ten_lo%l"/>
      <field name="so_luong"/>
      <field name="sl_duyet"/>
      <field name="sl_hong"/>
      <field name="sl_lam_lai"/>

      <field name="lo_yn"/>
      <field name="tao_lo"/>
      <field name="nhieu_dvt"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>

      <field name="stt_rec_gd"/>
      <field name="stt_rec0gd"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6iQiDma95rJEgDZwaYjvIOYF3BBM94WTKsOjq0OTmvMpi7BDl8Kxr8EZol/PjFltDRWKj2RZhNXga+MvI/QAg1N+wUk2VFWUuOM/3ujhCMoNDrBpnXq28AC5p5M1UauacUdgdSkcK8HfWxIvXRF03P6wq3W4K4MIwspFx4yHsYVJGodmoiXAvVBYcawByYjFFD/QVvQkcLgji8h7Qt5VdAqmj/BmvEonYk3oma6LNfKPcRx3FHklak6QXihx9Am/q3Ejq8lBl5iTXVoGC4OtsCskXLG03bwD/MonxlSBDRskXtQkqDF452ie+jg8h9ayLkefdJTye8OiCGT6svJOLTImhBuv7Rn7uQqJz75DDGGwr1IucaryUSWz5DfLFeCZjIrzFE3mEeqSHDaLj0oID5AA==</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8q+aAfaKX9gCfQOs4ezbHCT6QVLfAYlqPn6pUCfPrioQa0QgtCc+3sM/s6qawdTAA==</Encrypted>]]>&Code;<![CDATA[<Encrypted>&kF5JEuwtJfmtB14kre5wRS+MNfbADsH6mKCzZP68N7usVaXzuVYWj3EIoEAq5fz6Cs7ExDEaNnLGTpuI3s0YUjMGEX4CGgAFuzfEpv6dBo+0GQrqs33fgTaeBK0AQ/vzJ1WNaWPwPfQFw0/CvM3ojqGlrh8j0TQF1J+eMF3ckfI=</Encrypted>]]>&Code;<![CDATA[<Encrypted>&U5M9a2ZkLHTRJtDrNNZOF/k4EnPX01wJNRwj7TzkAnBYAoKbiCEp2lnhjJGiusloT3MIcPl9kyk+PnJMt3fgis/LEAOPQHaCeKfgc7WUsjYnXbCNg/EaOL6mfPDl7KSzfPRZOfrAZDXdnXS4fYN7TeheJvFWwl94V4x+eK+dvTc=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l16dCzkPCkdKPBNy4yMInqhFbmGwKKj7TWl9MVMGdvkN3lhjYoeyS5Lm5OCloznxTnQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPaSX9peRH2nRZu+rKDurKVhW9Ye2P9vN6XVGbzXjdRMpgtQkSCcygI0pfMbNNFx9g==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l16dCzkPCkdKPBNy4yMInqhFbmGwKKj7TWl9MVMGdvkN3lhjYoeyS5Lm5OCloznxTnQ==</Encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dOD/tS3XtqlDXQgE914HQ5HvzbxBgumpis5MOcCHCpbCHUxyVuwPcSDjoCj4XoB1A==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l1/Mogy0FPm8uUth20lwZPWYBwzPJ9Ex4kNqg9BAJEtfisAfN1RZE7Ea/ze2BG2W0CUupMWWsTymWOkEc7MAIKQw=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&JjwEvD9/bDKPJSKWr/Y3Rn6EKRmz+MBu/JQgnMRiuWps+8KbLVS68Utwzt//Pty5SlAyJeSMBkQ3SjzSrukvRw==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyEd6dUhmivDwyzoqUODQrqdvOh0nOUVe7BeBuS2lMmmwE3hawH1UOXkEJwinWUtEOuwzXQAhCp3UUtDQZ4Yoktg04+BAg2jnWfC5vQGpS9lyGCAmRbmL/tGQmvpOypKDZLjDLs8Xe02IvbSdcaHdBekPF+JqGKgDFtwQHJoVl/7VCE56NRVeF6LseBTjPBmXaB47PE3U4F8n0h1M1VDGNj4BqDel9avWicsMJooymKaRz</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l1+3cjzkMHK2RjfNJH5Zu70dl1WjkXDX9JwP53S3UEmP+95ICJRFgjzuB+h1lxS8osPBQ6bx+9IBgBK4yxtS1N0hvdkfUQgZWTZ2xFdpdpn6Y</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyERnOvM4NG/oV2IoQpuvFNmPT8aFeXkqML0n58IyfPpyVkz8IVlSHZz6Pw7bqJXbZjjpY2LqYNr9aJ1JwyAIuXtFB0GoNuFTWsp7LAbxOBG75CVbjtrCCTRzt0SxKOd8Jzw==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&JjwEvD9/bDKPJSKWr/Y3RpFum38JGD6+/2ip4K4YeIsczcrBjzVFVDjcIlS+YjbW//aydQhKRPn5NGs/fVJeTHbsb9gKQYH/ILjL08Ee29g=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l12EsMpyvYJtfA70TGj7FSEzdyIZ2XynZHLoqclMaURxJ1e1UzNOHeirZDNb+JBzZwEoFOTVecckgWaqwk0pVdoCYodIVzJhWLEiAfrRxgJXLgUH01lPZqtX/DcWYAOxjxHoDpSyciclLEqg8BYwNqpGOD0oWxT5BWroLpmJvb5/KefqrFEoMRSJopbfYaz0RggMZ4YWLnKpnzRQZkimrVIjR9+zBUNRgQ28VX6WyLudwoCWNnmnS/PrF7DhS7PhWvLmB3x8FrtQL5MGpO+1INdGJXPOomnxexZDKY88D1Ici</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l12EsMpyvYJtfA70TGj7FSEzdyIZ2XynZHLoqclMaURxJ1e1UzNOHeirZDNb+JBzZwEoFOTVecckgWaqwk0pVdoCYodIVzJhWLEiAfrRxgJXLgUH01lPZqtX/DcWYAOxjxEr5WhM9PgVMS8/KOZ+1ROBukkt8fawUfz9A6CCxlbjESpgAou1iDT8KHwA+hEl4Qi0xwbGncnnwqTuYbSVgJqFJdeBywWFDoxGthY5StRJ4h8Kn5fnAE2wnJcd7Wv1WPg==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHYy9NeuIBo360OnR5XHCN39eaq8KtsTRruJ6weU5YebnGSfVABhEkIYZpYt/RrU6EQIdbu+fgGaQmPOta40MLCB0ShrsD8biOISoE4MCv0M1hiu1HHnuw26qJolXa+GWNiJP8DTtnz9DDIybtlM45S4=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHYy9NeuIBo360OnR5XHCN3/IxkLk1IVoFakdNQPu6zycdUrcY9uAjyipxchkDtfiQNhxjXLyy95gVMyAK4YpuiaQzoXBRqni4wbOGdGwEexq</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyETI2WiGOq6VNUevZE9pq357DcNxnQ9HSc0BB2LwNdOowd5xhuCTqWPlyeJGmutd9kzM1MFg7rupLYJM0kTa3w5YBVtQWr+ago6kkBPRW8TwSa3LI1ieIU2PUw1Wqpw8T391zLeLRHCXF0zOEhGj5m6Qn6nTy6aCZygmD/dqvIiyP7uyRHL9T+kg1Y3IRcOY7Ag==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHYy9NeuIBo360OnR5XHCN384dHIe3cLnLp0EwR+SEYP3QjJCUye4clMqX8TBNiX9C8k+dDHax3AubF6xD3ji9ZZl5FejLwcoU/HUxKQhdIrXolzojnPKhM1DmhyrHa53Cgl6H49KSgXOy01KTbriojc=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHYy9NeuIBo360OnR5XHCN3/ersTRaa4L4ZGVDiPMfuyDoWD0AYRbTc6GonFKT8o6w1+p9i1ndb3MHiZ6tkYeRciEVQofqcG3wDjASQFF+X29AgcLPADh/eufjgpNQ7/H/reNlkeevKKfv71N8XcX26qbo6bvg4eVjQMvhUCC6xWVloyQ3Wr/NREv1Z1np4QVLDiGHticVZEoAxb8T1BYboYRHuqbdoHuZm+jUNu1DzrsB0U9BNFQ0ofIPy8CoP9TKBGzuKM+vk3p/Ozk5k+4E6Cbo2Xzq4zyUNqMU8I8HacdYd7JQptIY0j5xTTbKzSeYJcuWDSN8FKpBVJRSYdLII03rq3EBXfd/3uToxXaJl6298IfBCkcsM+2PfFk4qPvhQ53Hy7W7K7n7h0U2dYpk8A=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHYYYHZA0lH+CJLEFjOz1iv38dIrpvTIF0QuPGKG2v5rDBiqbUllZ1nhB9A9mFkL+gVLpY9PTy8/i33PcX5JD51nMYaKee0M7olq85PwqTyfQ</Encrypted>]]>
      &ScriptInsertRetrieveItems;
      &ScriptEmptyExternalField;
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK/KWW0H3wllwc+j4G03oLj1B66Jra2RsWCSZPM3/TkJSNWLrl2QcXbqLH/L3cyqz4R5WPurvONXlXPy/jxQyx5/tygPniSGVrG82pjVdXduiJK//ZfrB6eByq2D0qY0hOEQZq4i0Iu/MeeIoceyfWC3</Encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Grow">
      <title v="Toolbar.Grow" e="Toolbar.Grow"></title>
    </button>
    <button command="Down">
      <title v="Toolbar.Down" e="Toolbar.Down"></title>
    </button>
    <button command="Remove">
      <title v="Toolbar.Remove" e="Toolbar.Remove"></title>
    </button>

    <button command="Separate">
      <title v="-" e="-"/>
    </button>

    <button command="Retrieve">
      <title v="Lấy số liệu từ giao dịch phân xưởng$$90" e="Extract Data from Shop Activity Transactions$$120"></title>
    </button>

    <button command="Separate">
      <title v="-" e="-"/>
    </button>

    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>