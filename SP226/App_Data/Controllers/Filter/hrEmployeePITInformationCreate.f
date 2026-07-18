<?xml version="1.0" encoding="utf-8"?>

<dir id="0" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Cập nhật thông tin thuế TNCN cho nhân viên" e="Update Employee’s PIT Information"></title>
  <fields>
    <field name="doi_tuong" dataFormatString="1, 2" defaultValue="1" clientDefault="Default" align="right" allowContain="true">
      <header v="Đối tượng" e="Kind"></header>
      <footer v="1 - Cư trú, 2 - Không cư trú" e="1 - Resident, 2 - Non-resident"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZfFkdHUJGZRzLddtfeDImmOLYcVnVIbBZ33r6S6Ow2mTNlAyurTetcINZav3hKdB0A==</encrypted>]]></clientScript>
    </field>
    <field name="tinh_thue_yn" dataFormatString="1, 0" defaultValue="1" clientDefault="Default" align="right" allowContain="true">
      <header v="Tính thuế" e="Tax Assessment"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="tinh_gt_yn" dataFormatString="1, 0" defaultValue="1" clientDefault="Default" align="right" allowContain="true">
      <header v="Giảm trừ bản thân" e="Deduction"></header>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="hop_dong_yn" dataFormatString="1, 0" defaultValue="1" clientDefault="Default" align="right" allowContain="true">
      <header v="Hợp đồng lao động" e="Labor Contract"></header>
      <footer v="1 - Từ 3 tháng trở lên, 0 - Nhỏ hơn 3 tháng" e="1 - At least three months, 0 - Less than three months"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZfFkdHUJGZRzLddtfeDImmNHP1t+yuMyhGSXaegesJllAUrlL4pwRt+Yj70c5pKWuA==</encrypted>]]></clientScript>
    </field>
    <field name="uy_quyen_yn" dataFormatString="1, 0" defaultValue="1" clientDefault="Default" align="right" allowContain="true">
      <header v="Loại" e="Authorization"></header>
      <footer v="1 - Ủy quyền quyết toán, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="ngay_hl" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày hiệu lực" e="Effective Date"></header>
    </field>
    <field name="keys" readOnly="true" filterSource="Infinite">
      <header v="" e=""></header>
    </field>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_vao_tu" type="DateTime" dataFormatString="@datetimeFormat" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_vao_den" type="DateTime" dataFormatString="@datetimeFormat" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="vi_tri" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bac" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="official_yn" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330, 0, 0"/>
      <item value="111011: [doi_tuong].Label, [doi_tuong], [doi_tuong].Description, [ngay_vao_tu], [ngay_vao_den]"/>
      <item value="111011: [hop_dong_yn].Label, [hop_dong_yn], [hop_dong_yn].Description, [ma_nv], [ma_bp]"/>
      <item value="111011: [tinh_thue_yn].Label, [tinh_thue_yn], [tinh_thue_yn].Description, [vi_tri], [ma_bac]"/>
      <item value="11101: [tinh_gt_yn].Label, [tinh_gt_yn], [tinh_gt_yn].Description, [official_yn]"/>
      <item value="11101: [uy_quyen_yn].Label, [uy_quyen_yn], [uy_quyen_yn].Description, [keys]"/>
      <item value="110-11: [ngay_hl].Label, [ngay_hl], [ngay_tu], [ngay_den]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwetFxBFoPILuYbQazwN5csi0XC1K5j49FHaCbA4FpNPToAH+b508mYSbfzhjTD2c2g=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XHr/yZgO9BS8mxonQy//dUuUJDs3WZqAkpuzR+spFjnA01LEL1osOqoXzWuSER/daXOi8kNj6cev8SWUzSqulYUYLFlSvoaO7PuH8ijeySuBEjVDGeu3/uCFkt0uD1bn7bC9ZAgbr0IdI3xPt5GCsn8O2mCWb1HCujL1ZOG1TCrLNSGH2SUxwk1wn9bbe5qGyzazelQSpQMYeOHaROiC4exO01z1azpvdqsxqkIj+mVPaCHVcIBCazzWcEU5JYsKwA18uFClbQFMNuWg/cSc4jJ8m0AGzhC5KRhmD8bpwlHGM0W32/YUMsHfaSytwmj9cBBpneEbM54A3erq8k6+Mh6YTdFWDOP7bzZNTsM1SLXeC35m8nDALEqOvyBZcRU5x2B2gCNmADqiOgLzbHw7Ku+f0mHTKgab+VC7HtF4mmb8RWykx1hsWqthzAsDTCJkXwq9ft6N2dFQvtX6lNEu03o4sp5TUnyz6RXM6F5xJucoB+o48aM+DXMaQ0S0rRNYZg7MWB4JNdo75pXCQ3EVomLqOodG3mMP0yFnYGZmRVMH6ZrItRYOB+FCvK4sOu6E6orCuGCynqb627eEvKSUuuQPQxqF85WBce2AcBXYbhc7HCegtm8HJVD74QtP7mqHZ0nzACg4TRRZaqbC/qDMII=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkZ4UwdHzCv4M+jzUjSIKWJG5tBV+rFhfaAyk4RMpjapHldRtAk+JdxsyE8u/e/IAU2wvdFK1mWXwgr158NNjLKcy1wc4SPM51bsGb4Cmahb/F8xuq4Wv6QLbCqnttqdM5PjndQ3dNvEw0oO0broldwQ3J6+fgtI4p5gW7D5mi4vCFjqRaXDSxrbJXqEykZ4Sr0cM3Db2N8UtxZ9Ta6NtBZxrtTlE6YeJ7CktZX5v69VLnTyk4/gPkOOLw9wbl2RpptD9tA784oIRKT5rcXKdeBiyWrVGSHozc0+GMt15jsWRtmsXv/MEaGp3c7PD3DzACJBT0bP44n89zL0ccpPEthj9n8qe/dUxS/mzOw3/yHPRfnAbOKVMf6JAbxZth1Pa7qXOR6kTj2V48KjcEHvFa7p6OH+13vPRURjb+G1ga8JpdG26ZJcdzm1dLkCwPn7jOtRSag1dm5IRvxFkzJWrDgPukz4oBpdejHy3YaaE/Jl9rsr3nYgVvfH8fvGAcVmtdmc+DZ68FNWAY+FeCxIjz9YxecxF+Mw0vlOi0MNSIC+fN78ns0ReWdpRiARYQZyPe0eFidw/kB8ni44ysYsuM8hrYpEr8M8HqLQGmzpP7ZpTZl69zWTTiJq68sgWATTd3249FIMnlUFsp5WcAh3nJxc2Nr6b886R1lfkHZyUVYhp6c21DDmQlOwzQrIbrGysc0cHl8wXPi69yCpwi8zrOB1Cz6lypOQDFeMMIuY01eod2Qz9DT7Snk2unOwuTAG8pmV6D8Ta+C15cApD545KXBEEA9G45O383iyoT8o4Z1JDnwZC5mFQOCrZn3jekQeN94zilxJdEhy/9/5IQytt+aYQSxxuY53c961iCgdcmCJBemY2xlvY9Z/h9GgCHIhI9FgtVaMb7B/R7H3hsbboEMCK71oNqqf3kLLMvfBpHxDmQ==</encrypted>]]>
    </text>
  </script>
</dir>