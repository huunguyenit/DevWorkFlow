<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
]>

<dir table="v20dmnk" code="ma_nk" order="ma_nk" xmlns="urn:schemas-fast-com:data-dir">
  <title v="quyển chứng từ" e="Voucher Book"></title>
  <fields>
    <field name="ma_nk" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã quyển" e="Book Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_nk" allowNulls="false">
      <header v="Tên quyển" e="Description"></header>
    </field>
    <field name="ten_nk2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = 1" check="1 = 1" information="ma_dvcs$dmdvcs.ten_dvcs%l"></items>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ky_hieu">
      <header v="Mẫu chứng từ" e="Form"></header>
      <items style="AutoComplete" controller ="VoucherTemplate" key ="status = '1'" check ="1=1" reference ="ten_mau_ct%l" information="ma_mau_ct$dmmauct.ten_mau_ct%l"/>
    </field>
    <field name="ten_mau_ct%l" defaultValue="''" external="true" readOnly="true">
      <header v="" e=""/>
    </field>
    <field name="so_seri" dataFormatString="@upperCaseFormat">
      <header v="Ký hiệu chứng từ" e="Series"></header>
      <items style="Mask"></items>
    </field>
    <field name="so_ct1" allowNulls="false" dataFormatString="@upperCaseFormat" align="left">
      <header v="Số bắt đầu" e="Number Start"></header>
      <items style="Mask"></items>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZRBf+OyfxEVrUf1k/7hCp6l/0TOotqTwS/CJr/36YKu4ioQpsuS8TGlEWQ63jZluAA==</encrypted>]]></clientScript>
    </field>
    <field name="so_ct2" allowNulls="false" dataFormatString="@upperCaseFormat" align="left">
      <header v="Số kết thúc" e="Number End"></header>
      <items style="Mask"></items>
    </field>
    <field name="so_ct0" allowNulls="false" dataFormatString="@upperCaseFormat" align="left">
      <header v="Số hiện tại" e="Current Number"></header>
      <items style="Mask"></items>
    </field>
    <field name="trung_so" type="Decimal" external="true" defaultValue="'0'" allowContain="true">
      <header v="Kiểm tra trùng số" e="Check Duplication"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="0 - Không kiểm tra" e="0 - No"/>
        </item>
        <item value="1">
          <text v="1 - Theo ngày" e="1 - Daily"/>
        </item>
        <item value="2">
          <text v="2 - Theo tháng" e="2 - Monthly"/>
        </item>
        <item value="3">
          <text v="3 - Theo quý" e="3 - Quarterly"/>
        </item>
        <item value="4">
          <text v="4 - Theo năm" e="4 - Annually"/>
        </item>
        <item value="5">
          <text v="5 - Tất" e="5 - All"/>
        </item>
      </items>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZbhJBNGBbOORO2SilqhuFMv84Bgk6+vPcl21HxUMfyVpKiWGafJWjNHe44spAjiApKhYl8NUK5jUM53A2qMO9SzQWu+NVcPbqNA3f3esQOcULKLXwnM/ErdVbF2plQqVzw==</encrypted>]]></clientScript>
    </field>
    <field name="cb_yn" type="Boolean" external="true" defaultValue="cast(0 as bit)" allowContain="true">
      <header v="Chỉ cảnh báo" e="Warning only"></header>
    </field>

    <field name="ngay_ph" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày phát hành" e="Issuing Date" />
    </field>
    <field name="ngay_hl_tu" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày hiệu lực từ" e="Effective Day from"></header>
      <footer v="Ngày hiệu lực từ/đến" e="Effective Day from/to"/>
    </field>
    <field name="ngay_hl_den" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày hiệu lực đến" e="Effective Day to"/>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 25, 25, 180"/>
      <item value="110: [ma_nk].Label, [ma_nk]"/>
      <item value="1100000: [ten_nk].Label, [ten_nk]"/>
      <item value="1100000: [ten_nk2].Label, [ten_nk2]"/>
      <item value="1101000: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="1101000: [ky_hieu].Label, [ky_hieu], [ten_mau_ct%l]"/>
      <item value="110: [so_seri].Label, [so_seri]"/>
      <item value="110: [so_ct1].Label, [so_ct1]"/>
      <item value="110: [so_ct2].Label, [so_ct2]"/>
      <item value="110: [so_ct0].Label, [so_ct0]"/>
      <item value="1100-11: [trung_so].Label, [trung_so], [cb_yn], [cb_yn].Label"/>
      <item value="110: [ngay_ph].Label, [ngay_ph]"/>
      <item value="1101: [ngay_hl_tu].Description, [ngay_hl_tu], [ngay_hl_den]"/>
      <item value="1110000: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK6v505BRJlqtL6UFhwXLMIFxy2M7PgOk08yBAeLQn9Zm25zYX/iyh9odmTJBcMrZ/aFHdh2KOi08xCr9VUlf7U8A9a/qCg1ICh+owz3xn+KOSHqr30ii8ozWiY4TEA/ehqWfjp8hSrVIGlEzBxlzPSTj9EK+RjJk143Fq+gF7vgVg==</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bRdq+JMvaYUwdjDYqWqhq21SKXY84ucg/nMIDEtTVo+uC/plL3hM22HvKi2yVmiEBgTeFUY3KI2H1w90GUWLT1HzC8jfCJa8bJJUr6XI8tkESqTmSl5eQ6JmyNu/7NXxpERU/9eYx4RuOrdwaNCfH9It8mWA68X5+/j/ZqzsiOMjC0Zf2dXMLTrqZHrMxW857jtQ9E/4WOtWPTUBUvaJIZCyQ3oqWGf75Mnb9HpZqzCo24rF+mB7OhyZyslg8JYxbS1hGR9scvfsLTThJEE5ZR01sLO1TMSMhhp1/BTVa6VA6qX0qbpqFBRoWr8yNFMMcy6sQyCrTWPs3Nrf8WAlbNL43wFaKWVV87AbaVBgn8k</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfx0TKzd6yL2BlhLuCXsLiYIAabrOPqcnlVSaQKX1ALtoGbxKzgRNUhDTHVytKCPBkSqoSMJfPsp3PmEblBTxDD4=</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3LLr6oXl2cpQ703ltBLu4SMNnKbEG2UZDZtBaJYmLnke20Cwg/jjABwZu2HC/HJMqoPSBNAc3J93HE3zJxrap/g9yKL/lVH8+t9S2Bldd17cUG5tpGgPwlngWY8xkKF6saVkt0CU35wj8/slvX4UJo=</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6Zby6i+PRMeh0831bNfoXSHRUJXDiM2qXlmnGQmAfKmzefxv6xcEytJa58lelqaD/+UrPO/fFlOd2f3LwoVD70wsbYWJAIQXutWDk4jubU6J8F/8rmwZNZ4eSuv9ph6pbd47zAvb6ow9usVmhPFMgY9WfJnp0mhElWX2BCAy75VJWSCRm1xoIfMfMn4GjB9q/w==</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbTihtmGQDHec8XcoCrOAY8DXeeCi+ES4uYv5Q4DQ/vZaWddXCI7PWaotKgYu9/5x3oPW/cdNvYTpnxJYnWRCkGs3LipiwHlWCFLCQa1S26QcouxuwCNSv9LJumkQ/bCl7ewCWpZ9h1x9h1BpKz04YPYKi7mQlpnUN8mFwsk4HdD20gF5cGwU/qNoQG2XSrD3Xmur8kiDHmgZoWq0bCBZFLz0CA6lrVaoEwXkjXjXRmF4PYN5QKS/mc2HRr2ECcClzKx3kSK058y727dn/7hqpRuDU4ybisXEeABttsvEoL9bBvixWps3VNWPWoayOnpeipnKF9Y/UoLAE0f8RupTs2KiYtzErVoqLBC/jaRlUFB/YbOZJh57SrWruvnqe/eAxGlirQdrCT/l91x8P+R9Beqmq4x62a5JiUz0Jt7YZo1uSoqHSiOpGik/BbV2Ux1xtTtUgA7FPZfJFvZp7ZvMdKYBkaDkaGz/D9Xc3XTNmnLTC6ak+xFCPtsWdKYMEb7brk34xFJ5mr2OpxjEyOil8GWb+b9h4ObQDpwsk4hFrSW0r29j4wWS6gbIkQF/yzZhi6N6UHm9pYnuSASzsOhTtXQ93mxdkFq6P4eODzIS25XXCh072okR7JANGoBUmgtJuI=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82n51/dAD/r1plpAdOFKBO2+rfZiFp//rHQGD+LOXj+9DOJfyQXvuggJr5fbGkICXzGm3RTSKHheMQzAtEKnD8VQ9xhEp2zQREWgpfHV8UB54RhioPKDZK5Fr1pShEgsGAa8uQk9r0PTNWPGCf5JxeXpyyV5RTKhJbLZN96HokuIr80yIQ9355iW7vL0pn+EN0rnscB20NaZGoC30ZMdJh+FmEfmdtN+z4D01ktLe6nyKjlTNlCh3JqwJ67JRhAA+LT/WodjpB7lS5oOhoHzBdiMxj50sKJyFvIokyzdFjP4as=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jo6466a8R4CE1FVR+qWo5ikQhu4PVXYV12LcENVdAz5+txN30KNThdv/1flyKgWe4uORHCG83MQu8aNE/LMEKqYQ9oNzb/OalvSbKLYaynnxGc7jJWL+46tKHwqp+wNUmDReVnSwq2u6ZrZZ8fiUT6YfZ1nPeGyUcIpaVpx2aWluMLFAEtWtuizCtNmdpfUWwWzZTCBfjFBBqE0DlEbwjT9yHHpSUa1Xs0scatvmmtiM7O0sAUHFYDQWNI8KiwqPS+9shgk/MLAlHEtWy8kHHUERtFbV9FQg9Y+kSlyKZ8DDw9JyPHlawhRAuZhKjkx9SAeGLOa0uk+FfinWqCSVbmLS1wSH4+yQ4EnczrNDOdUfjPr0drDr3LcIKv73fJ+iFMTQ3E/reMDNNvpSS+N00pd1pVXfTnVouRwfHwCMZM1/SS5CoO4Kv4hdXrbTA1T4fX7ym4heqUOZREeSI3dIZLg==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ohvMFE2IyZEhO1aLs4PykWk0UyYyK42+aMoF4pnMzfmnjL/Z4XzF6wrYVy6EFDS0YrGqY97uaRnAbXge05k8y2pivqhP5t4zEvmMSadKE2537XWFPUgzFlodo45m5BP3EzG9H3+IvTZjKOsvd1Tmjfd</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHaMIJOIdLApwJ5aUDBaYRCa8TKB7auek8Z09swsfSYjgbIIaOKnK1kG6zAUXWyTvgv4bYZLpmChyFa+ug97pJi8ckedt9bEZVhaNMCokPFqZjLaWp+Pjzxb8B4yNNkd5m9z6KvDUglT5JV2lSQqbWAAwubAr1rg9y9YrfAjgrdpM60ywfdUc2TU47gC7EYp2O4=</encrypted>]]>
      </text>
    </command>

    <command event ="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70BE03k/QWQbFKqNJZCQ7zyjYe5E6shHhIX46pBsDjvDggTD8ZYxbM0HEMUxoFeF3b0TZD6cOuFlyQ3eB0fQPH/1HS3CCQ48I55UhI/SQapUvxj0L+xYDVG55iCKiriDRIdrOpCcCuBCLmi92s0QBo98f9dUapv8sBgKjxhJOCTL/dNX1/gVUIUwvfN9jtDYMKkduoQepnlyHHFxB6CA4YqyT7Rc4pWPFUG51Vac3gPXoeSv7nZ58YHmBvAbakM6CvTnRh7jvYcWKcGIwaA7eNxtbBb/X/8r1ZarR+BAg8sQpg/mr/KgyIOiUfNd5zkZBUe4F9KTaOSmpWLL/XKjGPv5puOaYyZP+tx8YlnIwaNTiEXLrJD5VEADmyBHMLenumQ==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%j1otayK5ACecpldW/VwtPGExdfcgqoA6q3bCeVirNlHnr3dP0yxjfW3cTBL9Za/KsnzsX2NMdX8y4H8TUGaU3lVP3AmLJsyd7Pv7LLVkFY9a8hK0CfC3XLyDcD5HjAP9LH20FFtOEqRqyhuXdjQbJrrW2TP0pUQuEndSSRvmqG74RQdCrVejsrjlMPt+pPVlTXJ3cFiSPxHE2qCvmSfyrddfuOxj4UVtofq3r4robUVk+7eyH8Jv4/I/+tE83JKFUYWm1mg2eDZdTf6r1P3tLZ32u8Etn2jaMrLDFvakWcCVwLX+yrQSQqA0hl8oBCBP3ft2IJIzwVvA+iZx2bJj63QiNCXEI02F3Wxp83bT99VuzDwvPd7jeYLUUmEtWqOrqIrS3Ui4UQPIvcdVmt2oRb0wXQPgE5PqBLFiqrEUjF8rh4rdLbhlM5bTrPNaUVMmhbQiSiEq1cQunoOFtR4c3Gk+TEqMe/kDC/pzpmRO6QSAFTWoXvFO5WADI9qh0H8/fxtSMzVKmGRHs3ygDlFBnKdsuXKxRkBHiNPH3n9hlygKgh0hQGk3qDBV4xFkfqm+VPgbAIE5POtwCmLNT/b5i8zXfbkmOmat1zrL6d8CwyH0zzpfq6ku759FpoGvioCdE5Y5yTHlJJUxeZe5S7qQLYMsL4P+vgPdkRtsoZZ7hIme/6aYSLqb4gaQWaIEmPyjxRYJkbR/RpHxzIKA9wSWdt9FpJmQn+3T09PFp1iW72LlIiM30UpAOwIhENUHa+SONDg/nlZ3/Z8GagBOIxkGR/LWMOfTiIVgQg/aIzO6se0LwaWeNNCxB5QZta7z9/l0D/v5FG/T3bCtaXL+LjiugBWIQxaY29Z58Eu8bRzPCJWLOHcCuQ/spD7m7sdQV+ggta7BMVVoE9FV3ysflovzLl9LL19ELEhBFtjBXd48syKtrL6BKVKvGy6cJCOL13zhyuRoDD5LAs3dzc8N0Lo6oPF06bQCeEKr+ISwY5wGqyNLR3OvxUvus77gmNO0pNBuaC2AOIbDsqEwRFEw5zX187eLQY8QorTmHc/wuXfH328foWFzJd3iIF9+P7Gs4BmStP5NiHXkzYF/DGxaWDwUvjJ2K3Fj46FFANoKmvQ+l2WYl2vpNeNf5WaXDxRkBgTtLD/m8lt374847SRyrsj4Sg==</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

  &OutlineCss;
</dir>