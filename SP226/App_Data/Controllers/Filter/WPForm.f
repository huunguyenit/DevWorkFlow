<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLFlowFormFields SYSTEM "..\Include\XML\FlowFormFields.txt">
  <!ENTITY XMLFlowFormViews SYSTEM "..\Include\XML\FlowFormViews.txt">
  <!ENTITY XMLFlowFormCommand SYSTEM "..\Include\XML\FlowFormCommand.txt">

  <!ENTITY Identity "WP">
  <!ENTITY DetailTable "cttt30">
]>

<dir table="cttt30" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Hóa đơn chi vượt" e="Overpayments"></title>
  <fields>
    <field name="ma_kh">
      <header v="Mã khách" e="Customer"></header>
    </field>
    <field name="ten_kh" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày hóa đơn từ" e="Invoice Date from"></header>
      <footer v="Ngày hóa đơn từ/đến" e="Invoice Date from/to"/>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày hóa đơn đến" e="Invoice Date to"></header>
    </field>
    <field name="&DetailTable;" external="true" clientDefault="0" defaultValue="0" rows="232" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="&Identity;Grid" row="1">
        <item value="ForeignKey">
          <text v ="String: ma_dvcs, ma_dvcs" e="String: ma_dvcs, ma_dvcs"></text>
        </item>
        <item value="ForeignKey">
          <text v ="String: ma_kh, ma_kh" e="String: ma_kh, ma_kh"></text>
        </item>
        <item value="ForeignKey">
          <text v ="DateTime: ngay_ct1, ngay_ct1" e="DateTime: ngay_ct1, ngay_ct1"></text>
        </item>
        <item value="ForeignKey">
          <text v ="DateTime: ngay_ct2, ngay_ct2" e="DateTime: ngay_ct2, ngay_ct2"></text>
        </item>
      </items>
    </field>
    <field name="ma_dvcs" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="292" anchor="4" split="4">
      <item value="120, 100, 100, 217, 8, 58, 50, 100, 0"/>
      <item value="1110----1: [ma_kh].Label, [ma_kh], [ten_kh], [ma_dvcs]"/>
      <item value="111: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="1: [&DetailTable;]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    &XMLFlowFormCommand;
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70A4fLbLV3kHxv6jagmvQXiQmVKU4qOaErPxnpphD6J+4</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9JZdL8G59SoqzF05WfH5ag3tfTyL6DFnS2waDAxeN0pXtW+Qyc7oAcrUsP9FcdrFN7uG1QmFzwtOKf2UPtqfM7rhddLkm8FuBGJq5c/7YlAehakamaYCfLm4cZrAjrhKnA==</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9Ac6ieFqQHRAfjjXPMzu87lxdFI8JeKgtlPwSXTCx2Ttmias7EFgcwnnSElVQsBcKw==</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9FHxTIUEvJi6MTJ4CXEDv1EpYSloEUvp+K0DgEsCQRAt5Z9Jp/OWtTcS9ZySVdavQe0QjLDhHMxILD+j1o8+JnAhhln/LIMG7I6ydf7PgMSsKZKBcdfTnF2EeoiQxaHadWagc+RyPo8ZuWlVxFYk/H6Uvj2aFmzNRpyvbu8qtG3A3g4JbWKr+h+Z17R6XI4D85PID1nqr2+tWXm0orimnMgMdC4PpcFhsCrakpLr4Qsl</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9Ngw/e5mUNSQfG0rHhVKw8Cz2hkv0KX2Ig6TmnaiSV1oe6QKjOPtCM85p9Fh6qDglts0Koc+GtrpTjw8o1F5qtc=</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9Ac6ieFqQHRAfjjXPMzu87mZZTZWmSpVnN2Tw9fy5b7Z5uK5afU8dEPfrZV0SkMnFIp2KxwEvb7M1n8aWNDnWlM=</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9EtyXG5Dz50BGy1srKRyoFYm5/ztPQciV7O9Mw2JUqeBbtueTL4Xgdpx7Ijp1mG8t9nwylckKF5JrjigCruUzOm+TcvDFDAIYhvvTC8BTtbpfB+rucbtaQcyop7L3rQB2OAVZfDvKUy2vl2bHeGxzLQUZgDEU7N/OyAToq+4ayDt</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9F1mxH/NDeiIx5Eb35/mdOKAWjqxOqvAVIHkCB33P6ojltr9nRNZ0PtiPhubxXbiZnTXKvOJnj9CLsiLpRksx/s=</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9E1xAwqunF1QxhTKuknjKkvEOhbrnzwwEkdScw5cZzFP/v6GyBKazTd0g6IAvnPEqw==</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9Ks+cMykz6XumP0keQrCD4hqaN6hlVQP6WtIuLML2Y58NBA2XwwbSyr0+GHbJwCq3GPaS6xDk8l/A57+QWZJCVc=</encrypted>]]>&Identity;<![CDATA[<encrypted>%zDp//xMNnZ9m15zxP4+q9O11Ok+FM+pOodAeyr450QWpUKIdOJChu+Z+yqvJnVo+aoAxsn6sOzA+CMjMqJXCz/SBNwfBGwCgWOLZjS+nNeo=</encrypted>]]>&DetailTable;<![CDATA[<encrypted>%0zykrLrNegqps1ohJUdnjpWTm4oUnavK3naIFBZaqrEmJV0tzP9qMP0QK9RWAyL1wQ6P1le07l3sbqOThsjzDrKf+IdP/xishTMZNt2MVP+JDDKTu+wABVabSAlkr+Z1+CJWEIZEB2UCJD6CjwN0tsLLl9KVslV7joSf8u0V56WNbrCOd6+kTSZ2XHKfeJhTFrDkIJN2R8BbDKGh74wJRYexyWP/fynXe6+1UlRCn+bnYpBu1imCjlgKbkGWlU9p6cosEF+HoEdjM9Gtdk9KtfTat6T2uEO0U6NxeNRvnZIQlD1wGYpReCjH6LvevJKMz7RW1Cgy2VwE6sqQIMy9Kp+HyuHGx3C6eT/DkAU9OMUZh3OuFyhcYz252O5sfN77fJlxE82fwIMGgS8LJwfPFc6ChJh7PkqjzHu43JJDuS5S52GBlueMX8pF0N4fvAeCOyozmGxRP5dtoYiJrmCeGgcYS0KPemhHSx+p9EYwfkArvkDEU5i2jxFe50l1/Yj+7DM9FHwSfsVWZfeqed/u/r2A8QqZi0ydDHj1imTQoDg9MOqqVtjARP5NmsW8H2Q8r2wWpISuOgwMWRTFJzDxnWROw3t2Y8tgEFfgTjgiHetbYEmb85VpsLq/jc6ajWH4</encrypted>]]>
    </text>
  </script>
</dir>