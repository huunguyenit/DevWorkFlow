<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY Identity "MRPDetail">
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
      <header v="Sl đơn hàng" e="Order Q'ty"></header>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMq6Xh7xds9o+3oCl00TufVGLE78mW1GUKVnWVD5XSrl</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l16dCzkPCkdKPBNy4yMInqhFccvlF+UYh75UKXSvDykln3Ickvc7nixhs5a/aB/aYnA==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22ciTfxXLWkc6njlqPxulQ8Q0LC8B5NMqT/jHhfrgr+Va</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l1+IxxnpAUh+rK5O3sFPyOzt0GlTMt05ZpehthVlkBH/N9+MoFpV8qmdUHRGsJO/j1A==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyETrgg2cJAUUEvqFMrqnln75mCWU6VHA5gaVmr0U6cobIyokZSQsX5brLGl355MR1OA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l19JI98VNGAW8ycs4MrU8JzpG68cRzaZG7H8DVH5SR9/PQsEnhhhho+juL6e3rngEuw==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyERnOvM4NG/oV2IoQpuvFNmPY4SNZoMxfKYYSfTxVuOOtUPKTYyqgRMJw6ByT8kl1HEyh8VQeufxHo74orBi4bjQ=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyETI2WiGOq6VNUevZE9pq357DcNxnQ9HSc0BB2LwNdOowd5xhuCTqWPlyeJGmutd9kxF2kUcTHSh8q7Dt4Zlj2rGlbKOrQ1Bh7UnPRrG9zuxh8aj1F/Ja1agXzn4WbwsPzj4NDz8jjT+Rake3B8+4Rlu7BbjPbQDZ5+HSDEdXAvS9PeOfqhgCoee6Duz526FtxLsUuUna8ekusWG7ZIUi6a0rmEGsCGfRx6qV+4BW1DO9PUBnAf5fRzXFKarVW6xT7ID3DfUMkZ56XqUVHk+B7Lw2MNdr1FTA8yIZfetqDhyrKIKJ+A8iMu85BXbRtECvrEUEA8tTDRwQ7CZ9KfSoCPCRU6Tw28Ab7Am5shYA96Ix1rCGhuyLNZI5kJKeE2+4LsHR6OEyVrjNb+ynuMvKRkT7nWJnxZjtlJl343vGpoidg3Vk/n2tZ6BG942HJfxELTJgvhJGGKfjo7VXVG8Nmvde6df3V1p8j7Iotqkd+Ar2+18iY6TPXnEzzHKTq08m0IWzkDz5w0aE9KtAPmVdzzEw93s9bQUQleXa4GJAK5CvQYScCm295lCXSKNncW+A6g4AJgqbsT2/zBFaxKYqRsLMUoiXPf3GCElqJs/iwIWB0XN3pq+uyVymqWPwqdssBdVS88Qjmb7gIjUSae/5JBLvv+2CCmHfLFJVbP8zLDO2vdWZNhyCSejEZ3m31JpVLA==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&q6pYKOM9tqL0CpMFrS6lUoeheHWfii7XhwRaTWHd9O6czTiJP63Li7BARMXbbyBym02ccN7R+QslcEVvYs+97EDs942DKYFMeVH0hgXYr9Zj5tEK7wJyjGaEYefU6JG/p/u3pEpn5OiJe1/QdMk6FK4dOvFLyMgh69bu3Dlrf1Hdn1reG3qSZVJ/jY4IOpvxS6kZCT57G3hFncZQSUo2pGBpLlS85MhbpSt4tnhHCMYJcxhzDP78+JQc8kW85kEkBRR1e9MscxKJ4SZvkttMjOfFBVXHgade+Qxnw19K3VAUF6aY5c2vN6T8fQHXsl58JmH6KUY7P8+ZziLR6CWD7m2NRjBYFWYT7Q54pSc+OVt6xQ9tahYdypnsArRy/NBzRPeDyEjCC4DZgm2gUXQyPdMELpp7aLY9V6/osx97jyxpS2NmfsiHlvtF+VbCxfKerVSrYUbsjIn26deib/JAbAeChQdN13Gap3uB5lwlrFiKdJudO3YXR6dvwS7Ge+Vi</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&q6pYKOM9tqL0CpMFrS6lUoeheHWfii7XhwRaTWHd9O6czTiJP63Li7BARMXbbyBym02ccN7R+QslcEVvYs+97EDs942DKYFMeVH0hgXYr9Zj5tEK7wJyjGaEYefU6JG/3/XECTqU6WM03FW8YZt33yywJ1EFKayx9PVejUpGj21OA50SPkNdYH85qXR49uST8QEeh6zKpApfhl3tz9vlh4T8Qe1YP8GtfDatNxkaOVp76CQNdQGqHOnmwCTv/rCaUw2RLUGeszT5HJw7RMbwnGL1Pbqd483DT26ntrOMUlMSzXYgya6fDAn9XytzTWvjaOkVHHw9CIvqhcBiIEm4j6kBuhH0DmZYPbhrOpREVUjmbi5gRdG9MHtGwN5sHhNZhXAl0TAfSOGRrCrdgx2V6pqVgUQQNWIJJGxzb32K2zYKvWvrP0QBfYb0lAHDasl5HvhpJf460RnRQxdunSZSA+rXDCqWYjmvg9Wi0KoAqQ3aOMYWi9uLFw8f2UZ3/ag45mEi9rhRNMIO9dLLPWyxhcbOEdY+/dKY31MwHUVBFpQ=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaBD+rJu8NhGf9GM/FEfoW/p89DN3KgV8sQpSxKnzyWjI9J9bU7niY9BHLkLWZu4OeKcJ8qD3QVkkQX8cKubsiKkIX0Dz0CNf0IG6vfedLuokKsh4iCEUThzwziQHccMgXikhvammKkAa2HvKXgdicBlgESYVhAjdXOpsX8bmwThS8uU/PhfjOD9IYURC9c16XM0vmv5VNs2K3WL7Ef5RuKApqDuX5Mw7kJxxo4VphgnN/kR9y/ibrdY8HnSq+bHju5xTgQl1M5fmQzwP7gWAYuRejXdSQ1nbClo9G5bF1jaWnR9nZV+6ODch9vPEzPGIGg5QkcE8qjNK3a+YEECEkffrpzykzsIpsmsJ+jLqtkQ/RjlqaYUr/oV5IgQlGSwdXoiesrmCx/dSQwuOnt5lC7E=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&ExC4VyevidizrIeD1rekt8JvMUOBYBjeL9kRBeA7Rlks8kGYjHE6xOovb9OmCf3L4CryOLhcMSXZwKNRr1oYnnbLVBeXZpEhHLWvmV2YoYqrHbcbOVkT8j0AoCVHoUqUv+rf9d3wi8ncMIIfbPKLCte9/LgoVHJ1QEWSWqApAcY/3+iJelQj1tSg+LkiEPootJU0F7kTw26wb1hDiuTzWDrFK9kjowSgq6mNE7E0BWNoze3v0ThJWXATq6uxJRrPTYCBtl6Q7fiLNpp2Ye9h7NudQ6HnAdTtJJF3xQRTrLI/54WEpZLK0cSsCt+KM2ita2e+ccrDMCrn+/zsRABjkuCj7Ua6mYTlVUJO+KqEF1E=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&q6pYKOM9tqL0CpMFrS6lUlMKq8pzW+XHh8HriCIEKt43e6mMs8fZ/1fLWwCD+OGvXbbcthJ8wvh/T4c/6tk0JMvEWK3iJXbQKd3VUnnvSBzikyyepQ4WX8vEN5u5pz5WwCC8BnRgQFOdi3PMEWDHF624GoTSDXI0MULeNSNhZnLAXJM2rulEYdXS8T0BWAuI</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&ExC4VyevidizrIeD1rekt4OW5pAIHog59gTCLJoKlGgAVD5LCEyddnuvzOv8dUuJRpigBc8cCK4S0vQvKKf2sI3yxDaEXaIWRS5/kMrNdxc=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&+7DTusFUlZWkaudUaITYaGa5T02kdVsLaML3xBH/CZaQzxmSvasJ/IiMO5Wm0kDbAYO5Hv7q8jveWkn54N6sMQ==</Encrypted>]]>
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
        <![CDATA[<Encrypted>&Er6kBCOukK5FxLFOw1tnBwdkvSgtIXUhoIA4FB8nvozBE0sT9fh6DSevo2CO7HedGwBFZE4Cty440GH0IRdQ4x2qo87vTFylhLkjgkj9G40pNvz40fH4d/tI2DE2gPXV</Encrypted>]]>
      </text>
    </query>
  </queries>

  <response>
    <action id="Confirm">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4KZtIxBudcUNQklxS4yhKB3fOzxm29S9mZyHbgZpC2zc/c5xMHV1OOD6cDwq/SUKDz3zgLMvgdF41N1PXzWPC2mb7ESFOs+lhGF3O9/76DU7VrG/TXdl1oLV0AJwXa5lld0Kw9lZpVDUiyhKZKpAp7umnhBGsT32A6fCwBARIKGqnEX1eVv0gy3Dqswif6fvs0U6FAK0Qy1HZ060yrSpct71EBfJKHNP+QHr2OYGH+83E539WhFUvK+KMFQ2p+dJ3+Q9aiN3GbY8oBtzrG5811ft4VtXZSX6hXneSw5a3EjN94CF0MvRdVQLo/dfAc75QYlzYnk/72mw3lyxS/RIbdfaC8y6NXF/L+VD+OuH/fbkN8hD5DuGeKrw5GsETKJCD7A9eIsdgMjMBek8n7trZ4=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQugVFFMSxQGbz0li44BwL6g0+Pqfkt3th89D2l6es48HiSEHQODwFfG+/1Ffth8pQwbtMzMx9HaM2LEZVKSZ0Y5HXc5hw4vQoa51fjXIorXo9odO0f5eZzDPnJySUflva3R8UhEUeU6KmccN3XK/HuZ0=</Encrypted>]]>
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
      <title v="Xác nhận$$75" e="Confirm$"></title>
    </button>
    <button command="Revert">
      <title v="Hủy xác nhận$$90" e="Revert$"></title>
    </button>
    <button command="EditPlan">
      <title v="Sửa kế hoạch đặt hàng$$90" e="Edit Planned Order$$120"></title>
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