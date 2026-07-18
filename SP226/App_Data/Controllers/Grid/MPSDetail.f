<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY Identity "MPSDetail">
]>

<grid table="vmpctyc" code="ma_vt"  type="Detail" xmlns="urn:schemas-fast-com:data-grid">

  <fields>
    <field name="ngay_ct"  type="DateTime" dataFormatString="@datetimeFormat" width="100">
      <header v="Ngày yêu cầu" e="Due Date"></header>
    </field>
    <field name="so_dh" width="100" align="right">
      <header v="Số đơn hàng" e="Order No."></header>
    </field>
    <field name="ten_dh" width="300">
      <header v="Loại đơn hàng" e="Order Type"></header>
    </field>

    <field name="sl_dh" type="Decimal" dataFormatString="@quantityViewFormat" clientDefault="0" width="80">
      <header v="Sl đơn hàng" e="Order Q'ty "></header>
      <items style="Numeric"/>
    </field>
    <field name="sl_da_yc" type="Decimal" dataFormatString="@quantityViewFormat" clientDefault="0" width="80">
      <header v="Đã phân bổ" e="Allocated Q'ty"></header>
      <items style="Numeric"/>
    </field>
    <field name="sl_nhap" type="Decimal" dataFormatString="@quantityViewFormat" clientDefault="0" width="80">
      <header v="Sl còn lại" e="Remain Q'ty"></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_dat" type="DateTime" dataFormatString="@datetimeFormat" width="100">
      <header v="Ngày đặt" e="Release Date"></header>
    </field>
    <field name="ten_cb" width="300">
      <header v="Cảnh báo" e="Action Message"></header>
    </field>
    <field name="ten_nguon" width="300">
      <header v="Nguồn" e="Peg Type"></header>
    </field>

    <field name="so_ct" width="100" align="right">
      <header v="Số chứng từ" e="Pegged To"></header>
    </field>
    <field name="sl_xuat" type="Decimal" dataFormatString="@quantityViewFormat" clientDefault="0" width="80">
      <header v="Sl yêu cầu" e="Required Q'ty"></header>
      <items style="Numeric"/>
    </field>
    <field name="sl_ton" type="Decimal" dataFormatString="@quantityViewFormat" clientDefault="0" width="80">
      <header v="Sl tồn" e="Projected Inventory"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_sp" width="100">
      <header v="Mã sản phẩm" e="Product"></header>
    </field>

    <field name="nguon" width="0" hidden ="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec" width="0" hidden ="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ngay_ct"/>
      <field name="so_dh"/>
      <field name="ten_dh"/>

      <field name="sl_dh"/>
      <field name="sl_da_yc"/>
      <field name="sl_nhap"/>
      <field name="ngay_dat"/>
      <field name="ten_cb"/>
      <field name="ten_nguon"/>

      <field name="so_ct"/>
      <field name="sl_xuat"/>
      <field name="sl_ton"/>
      <field name="ma_sp"/>
      <field name="nguon"/>
      <field name="stt_rec"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIkDam2OpJKeUPrZ6I5WGFhnaMdP3TwDZh3ymfnifRK0</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l16dCzkPCkdKPBNy4yMInqhFccvlF+UYh75UKXSvDykln3Ickvc7nixhs5a/aB/aYnA==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL751wZiTGtWeHzFQZhMwU6K2dxZTKcK8IzZ4gALgNH9xBQ</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l16dCzkPCkdKPBNy4yMInqhFccvlF+UYh75UKXSvDykln3Ickvc7nixhs5a/aB/aYnA==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22ciTfxXLWkc6njlqPxulQ8Q0LC8B5NMqT/jHhfrgr+Va</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l1+IxxnpAUh+rK5O3sFPyOzt0GlTMt05ZpehthVlkBH/N9+MoFpV8qmdUHRGsJO/j1A==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyETrgg2cJAUUEvqFMrqnln75mCWU6VHA5gaVmr0U6cobIyokZSQsX5brLGl355MR1OA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l19JI98VNGAW8ycs4MrU8JzpG68cRzaZG7H8DVH5SR9/PQsEnhhhho+juL6e3rngEuw==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyERnOvM4NG/oV2IoQpuvFNmPY4SNZoMxfKYYSfTxVuOOtUPKTYyqgRMJw6ByT8kl1HEyh8VQeufxHo74orBi4bjQ=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyETI2WiGOq6VNUevZE9pq357DcNxnQ9HSc0BB2LwNdOowd5xhuCTqWPlyeJGmutd9kxF2kUcTHSh8q7Dt4Zlj2rGlbKOrQ1Bh7UnPRrG9zuxh8aj1F/Ja1agXzn4WbwsPzj4NDz8jjT+Rake3B8+4Rlu7BbjPbQDZ5+HSDEdXAvS9PeOfqhgCoee6Duz526FtxLsUuUna8ekusWG7ZIUi6a0rmEGsCGfRx6qV+4BW1DO9PUBnAf5fRzXFKarVW6xT7ID3DfUMkZ56XqUVHk+B7Lw2MNdr1FTA8yIZfetqDhyrKIKJ+A8iMu85BXbRtECvrEUEA8tTDRwQ7CZ9KfSoCPCRU6Tw28Ab7Am5shYA96Ix1rCGhuyLNZI5kJKeE2+4LsHR6OEyVrjNb+ynuMvKRkT7nWJnxZjtlJl343vGpoidg3Vk/n2tZ6BG942HJfxELTJgvhJGGKfjo7VXVG8Nmvde6df3V1p8j7Iotqkd+Ar2+18iY6TPXnEzzHKTq08m0IWzkDz5w0aE9KtAPmVdzzEw93s9bQUQleXa4GJAK5CvQYScCm295lCXSKNncW+A6g4AJgqbsT2/zBFaxKYqRsLMUoiXPf3GCElqJs/iwIWBMOT3Lbtb02wnQUAlumlF/1RhZKVofX4zEvwuaExJYuplWhno7mWIZaTz8ffDFbyVJwa4OLPMuUtqpTjInUVgoQ==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&q6pYKOM9tqL0CpMFrS6lUoeheHWfii7XhwRaTWHd9O6czTiJP63Li7BARMXbbyBym02ccN7R+QslcEVvYs+97EDs942DKYFMeVH0hgXYr9Zj5tEK7wJyjGaEYefU6JG/p/u3pEpn5OiJe1/QdMk6FK4dOvFLyMgh69bu3Dlrf1Hdn1reG3qSZVJ/jY4IOpvxS6kZCT57G3hFncZQSUo2pGBpLlS85MhbpSt4tnhHCMYJcxhzDP78+JQc8kW85kEkBRR1e9MscxKJ4SZvkttMjOfFBVXHgade+Qxnw19K3VAUF6aY5c2vN6T8fQHXsl58JmH6KUY7P8+ZziLR6CWD7m2NRjBYFWYT7Q54pSc+OVt6xQ9tahYdypnsArRy/NBzRPeDyEjCC4DZgm2gUXQyPdMELpp7aLY9V6/osx97jyxpS2NmfsiHlvtF+VbCxfKerVSrYUbsjIn26deib/JAbAeChQdN13Gap3uB5lwlrFiKdJudO3YXR6dvwS7Ge+Vi</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&q6pYKOM9tqL0CpMFrS6lUoeheHWfii7XhwRaTWHd9O6czTiJP63Li7BARMXbbyBym02ccN7R+QslcEVvYs+97EDs942DKYFMeVH0hgXYr9Zj5tEK7wJyjGaEYefU6JG/3/XECTqU6WM03FW8YZt33yywJ1EFKayx9PVejUpGj21OA50SPkNdYH85qXR49uST8QEeh6zKpApfhl3tz9vlh4T8Qe1YP8GtfDatNxkaOVp76CQNdQGqHOnmwCTv/rCaUw2RLUGeszT5HJw7RMbwnGL1Pbqd483DT26ntrOMUlMSzXYgya6fDAn9XytzTWvjdFU+AGSA+tf4r2pU6lRtMRpGynv2A5+pshDK36oHhcU67Dl885FOB0HnjEnscT53KEoRq7Vct0PsBJ9N3GYex/q9sZ1rJrPeRjoBNhJ8zPRkMIBg6xHrkZfeu71kv0N1ls3uICHibXiEFsWCC3EAdNm1gZ+Rb+RWTEivNrY4b8H/b2MJ8/tYEztxLueiCRVGmofa5SB6yHo7BbzjKlMXuPQywjOvlNjGu2BjdkQrn5M=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaBD+rJu8NhGf9GM/FEfoW/p89DN3KgV8sQpSxKnzyWjI9J9bU7niY9BHLkLWZu4OeKcJ8qD3QVkkQX8cKubsiKkIX0Dz0CNf0IG6vfedLuokKsh4iCEUThzwziQHccMgXikhvammKkAa2HvKXgdicBlgESYVhAjdXOpsX8bmwThS8uU/PhfjOD9IYURC9c16XM0vmv5VNs2K3WL7Ef5RuKApqDuX5Mw7kJxxo4VphgnN/kR9y/ibrdY8HnSq+bHju5xTgQl1M5fmQzwP7gWAYuRejXdSQ1nbClo9G5bF1jaWnR9nZV+6ODch9vPEzPGIGg5QkcE8qjNK3a+YEECEkffrpzykzsIpsmsJ+jLqtkQ/RjlqaYUr/oV5IgQlGSwdXoiesrmCx/dSQwuOnt5lC7E=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&ExC4VyevidizrIeD1rekt8JvMUOBYBjeL9kRBeA7Rlks8kGYjHE6xOovb9OmCf3L4CryOLhcMSXZwKNRr1oYnnbLVBeXZpEhHLWvmV2YoYqrHbcbOVkT8j0AoCVHoUqUv+rf9d3wi8ncMIIfbPKLCte9/LgoVHJ1QEWSWqApAcY/3+iJelQj1tSg+LkiEPootJU0F7kTw26wb1hDiuTzWDrFK9kjowSgq6mNE7E0BWNoze3v0ThJWXATq6uxJRrPTYCBtl6Q7fiLNpp2Ye9h7NudQ6HnAdTtJJF3xQRTrLI/54WEpZLK0cSsCt+KM2ita2e+ccrDMCrn+/zsRABjkuCj7Ua6mYTlVUJO+KqEF1E=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&q6pYKOM9tqL0CpMFrS6lUlMKq8pzW+XHh8HriCIEKt43e6mMs8fZ/1fLWwCD+OGvXbbcthJ8wvh/T4c/6tk0JMvEWK3iJXbQKd3VUnnvSBzikyyepQ4WX8vEN5u5pz5WwCC8BnRgQFOdi3PMEWDHF624GoTSDXI0MULeNSNhZnLAXJM2rulEYdXS8T0BWAuI</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&ExC4VyevidizrIeD1rekt4OW5pAIHog59gTCLJoKlGgAVD5LCEyddnuvzOv8dUuJRpigBc8cCK4S0vQvKKf2sI3yxDaEXaIWRS5/kMrNdxc=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaGa5T02kdVsLaML3xBH/CZaQzxmSvasJ/IiMO5Wm0kDbAYO5Hv7q8jveWkn54N6sMQ==</Encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75+lTgX9OAZWpKSxkDzm9aPZl/l5EJhiPAA1FDXibjMdSLJTjp54EE+jp/3k34L52Jw==</Encrypted>]]>
      </text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&Er6kBCOukK5FxLFOw1tnBzlM8KCYwMLUE3ySuZ69UMFOL9z+zhgJTFOzUYTvdi/Z0he7AT5mrylY5HhFZ0kcCGwvZYReePjwlay8WCVdrdhsGWyjHTEU78x61GEgLUZ1</Encrypted>]]>
      </text>
    </query>
  </queries>

  <response>
    <action id="Confirm">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4KZtIxBudcUNQklxS4yhKB3fOzxm29S9mZyHbgZpC2zc/c5xMHV1OOD6cDwq/SUKDz3zgLMvgdF41N1PXzWPC2mb7ESFOs+lhGF3O9/76DU7VrG/TXdl1oLV0AJwXa5lld0Kw9lZpVDUiyhKZKpAp7umnhBGsT32A6fCwBARIKGqnEX1eVv0gy3Dqswif6fvs0U6FAK0Qy1HZ060yrSpcsxmQX7l7zhGvKULWkkIV1Rr5ye4yHl1n84BoEIRERb9OkuQsOY6NbyzKhvuXLauvEvtI1xFh602DVIzQDp/a7f40/LF+55WRdDEB59S6jiGfxWB+wtp0gs0W1HjHDs/U7T4sYGCW1yw3V3Wj/dmTTTRiv6dZxZE15NurBhZTXfMw==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQugVFFMSxQGbz0li44BwL6g0+Pqfkt3th89D2l6es48HiSEHQODwFfG+/1Ffth8pQwbtMzMx9HaM2LEZVKSZ0Y5HXc5hw4vQoa51fjXIorXo9odO0f5eZzDPnJySUflva3R8UhEUeU6KmccN3XK/HuZ0=</Encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/izKywB7gs8GyzrPtyjqgTnvRRCZTGKWWWsF0He54t971NSg4io0Fyo4giWOYglKvwVp5qvCF0VRdkM6f3WZVEyrYkJAp3qLLgeu7xWFzi6TbnHZpqlzxpmKTptuV8kPkkm9vfj5yAGA7XZvK7eZAOGzt84YFPtlBFjp3fztvzgqlFboh1CiTMnAJMhCM//V/Rf9GhiSrLvxPXky/A1dXLlE/4r50td1lx2MLQmcpYxBKqiwkRiW0B6CAobDS6DrCruUwA4Ef9XshhCl03SiRk=</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Confirm">
      <title v="Xác nhận$" e="Confirm$"></title>
    </button>
    <button command="Revert">
      <title v="Hủy xác nhận$$90" e="Revert$"></title>
    </button>
    <button command="EditPlan">
      <title v="Sửa kế hoạch sản xuất$$90" e="Edit Planned Order$$120"></title>
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