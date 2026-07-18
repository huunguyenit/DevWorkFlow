<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "SODiscountDetail">

  <!ENTITY k0 "@ma_ck = $ma_ck.OldValue and @ma_kho = $ma_kho.OldValue and @ma_kh = $ma_kh.OldValue and @nh_kh1 = $nh_kh1.OldValue and @nh_kh2 = $nh_kh2.OldValue and @nh_kh3 = $nh_kh3.OldValue and @nh_kh9 = $nh_kh9.OldValue and @ma_vt = $ma_vt.OldValue and @nh_vt1 = $nh_vt1.OldValue and @nh_vt2 = $nh_vt2.OldValue and @nh_vt3 = $nh_vt3.OldValue and @nh_vt9 = $nh_vt9.OldValue and @ma_nt = $ma_nt.OldValue and @ngay_hl = $ngay_hl.OldValue">
  <!ENTITY k1 "ma_ck = @ma_ck and ma_kho = @ma_kho and ma_kh = @ma_kh and nh_kh1 = @nh_kh1 and nh_kh2 = @nh_kh2 and nh_kh3 = @nh_kh3 and nh_kh9 = @nh_kh9 and ma_vt = @ma_vt and nh_vt1 = @nh_vt1 and nh_vt2 = @nh_vt2 and nh_vt3 = @nh_vt3 and nh_vt9 = @nh_vt9 and ma_nt = @ma_nt and ngay_hl = @ngay_hl">
  <!ENTITY k2 "ma_ck = $ma_ck.OldValue and ma_kho = $ma_kho.OldValue and ma_kh = $ma_kh.OldValue and nh_kh1 = $nh_kh1.OldValue and nh_kh2 = $nh_kh2.OldValue and nh_kh3 = $nh_kh3.OldValue and nh_kh9 = $nh_kh9.OldValue and ma_vt = $ma_vt.OldValue and nh_vt1 = $nh_vt1.OldValue and nh_vt2 = $nh_vt2.OldValue and nh_vt3 = $nh_vt3.OldValue and nh_vt9 = $nh_vt9.OldValue and ma_nt = $ma_nt.OldValue and ngay_hl = $ngay_hl.OldValue">

  <!ENTITY FieldsList "ma_ck, ma_kho, ma_kh, nh_kh1, nh_kh2, nh_kh3, nh_kh9, ma_vt, nh_vt1, nh_vt2, nh_vt3, nh_vt9, so_luong, ma_nt, ngay_hl">
]>

<dir table="dmck2" code="&FieldsList;" order="&FieldsList;" xmlns="urn:schemas-fast-com:data-dir">
  <title v="chiết khấu, giảm giá" e="Discount"></title>
  <fields>
    <field name="ma_ck" isPrimaryKey="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_kho" isPrimaryKey="true" filterSource="Optional">
      <header v="Kho" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1 = 1" information="ma_kho$dmkho.ten_kho%l"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_kh" isPrimaryKey="true" filterSource="Optional">
      <header v="Khách hàng" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_kh1" isPrimaryKey="true" filterSource="Optional">
      <header v="Nhóm khách hàng 1" e="Customer Group 1"></header>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh_kh1%l" key="loai_nh = 1 and status = '1'" check="loai_nh = 1" information="ma_nh$dmnhkh.ten_nh%l"/>
    </field>
    <field name="ten_nh_kh1%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_kh2" isPrimaryKey="true" filterSource="Optional">
      <header v="Nhóm khách hàng 2" e="Customer Group 2"></header>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh_kh2%l" key="loai_nh = 2 and status = '1'" check="loai_nh = 2" information="ma_nh$dmnhkh.ten_nh%l"/>
    </field>
    <field name="ten_nh_kh2%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_kh3" isPrimaryKey="true" filterSource="Optional">
      <header v="Nhóm khách hàng 3" e="Customer Group 3"></header>
      <items style="AutoComplete" controller="CustomerGroup" reference="ten_nh_kh3%l" key="loai_nh = 3 and status = '1'" check="loai_nh = 3" information="ma_nh$dmnhkh.ten_nh%l"/>
    </field>
    <field name="ten_nh_kh3%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_kh9" isPrimaryKey="true" filterSource="Optional">
      <header v="Nhóm khách tính giá" e="Customer Price Class"></header>
      <items style="AutoComplete" controller="CustomerPriceClass" reference="ten_nh_kh9%l" key="status = '1'" check="1 = 1" information="ma_nh$dmnhkh2.ten_nh%l"/>
    </field>
    <field name="ten_nh_kh9%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_vt" isPrimaryKey="true" filterSource="Optional">
      <header v="Mặt hàng" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PDvdTvJOEgRcT99dbkFNK7EOXWzm++jrRim2d/a5RnX</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&y78Ua2DLSLK5rokICbdsCuUzsTHTuG4BL8xxOEj3W+4gljLvbDWCk7JwtIUHV0Zv</Encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="dvt" inactivate="true" filterSource="Optional">
      <header v="Đvt" e="UOM"></header>
      <items style="AutoComplete" controller="UOMItem" reference="ten_dvt%l" key="ma_vt = '*' or ma_vt = '{$%c[ma_vt]}'" check="ma_vt = '*' or ma_vt = '{$%c[ma_vt]}' or exists(select 1 from dmvt where ma_vt = '{$%c[ma_vt]}')" information="dvt$vdmvtqddvt.ten_dvt%l" normal="true"/>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="so_luong" isPrimaryKey="true" type="Decimal" dataFormatString="@quantityInputFormat">
      <header v="Số lượng từ" e="Quantity from"></header>
      <items style="Numeric"/>
    </field>
    <field name="nh_vt1" isPrimaryKey="true" filterSource="Optional">
      <header v="Nhóm vật tư 1" e="Item Group 1"></header>
      <items style="AutoComplete" controller="ItemGroup" reference="ten_nh_vt1%l" key="loai_nh = 1 and status = '1'" check="loai_nh = 1" information="ma_nh$dmnhvt.ten_nh%l"/>
    </field>
    <field name="ten_nh_vt1%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_vt2" isPrimaryKey="true" filterSource="Optional">
      <header v="Nhóm vật tư 2" e="Item Group 2"></header>
      <items style="AutoComplete" controller="ItemGroup" reference="ten_nh_vt2%l" key="loai_nh = 2 and status = '1'" check="loai_nh = 2" information="ma_nh$dmnhvt.ten_nh%l"/>
    </field>
    <field name="ten_nh_vt2%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_vt3" isPrimaryKey="true" filterSource="Optional">
      <header v="Nhóm vật tư 3" e="Item Group 3"></header>
      <items style="AutoComplete" controller="ItemGroup" reference="ten_nh_vt3%l" key="loai_nh = 3 and status = '1'" check="loai_nh = 3" information="ma_nh$dmnhvt.ten_nh%l"/>
    </field>
    <field name="ten_nh_vt3%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nh_vt9" isPrimaryKey="true" filterSource="Optional">
      <header v="Nhóm hàng tính giá" e="Item Price Class"></header>
      <items style="AutoComplete" controller="ItemPriceClass" reference="ten_nh_vt9%l" key="status = '1'" check="1 = 1" information="ma_nh$dmnhvt2.ten_nh%l"/>
    </field>
    <field name="ten_nh_vt9%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="tl_ck" type="Decimal" dataFormatString="#0.00" clientDefault="0">
      <header v="Tỷ lệ chiết khấu" e="Discount Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_ck" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat">
      <header v="Tiền chiết khấu" e="FC Discount Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_nt" isPrimaryKey="true" filterSource="Optional">
      <header v="Mã ngoại tệ" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1" information="ma_nt$dmnt.ten_nt%l"/>
    </field>
    <field name="ten_nt%l" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_hl" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Hạn hiệu lực đến" e="Effective to"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>

    <field name="nhieu_dvt" type="Boolean" readOnly="true" external="true" defaultValue="cast(0 as bit)" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230"/>
      <item value="11010: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="11010: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11010: [nh_kh1].Label, [nh_kh1], [ten_nh_kh1%l]"/>
      <item value="11010: [nh_kh2].Label, [nh_kh2], [ten_nh_kh2%l]"/>
      <item value="11010: [nh_kh3].Label, [nh_kh3], [ten_nh_kh3%l]"/>
      <item value="11010: [nh_kh9].Label, [nh_kh9], [ten_nh_kh9%l]"/>
      <item value="11010: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="11010: [dvt].Label, [dvt], [ten_dvt%l]"/>
      <item value="110: [so_luong].Label, [so_luong]"/>
      <item value="11010: [nh_vt1].Label, [nh_vt1], [ten_nh_vt1%l]"/>
      <item value="11010: [nh_vt2].Label, [nh_vt2], [ten_nh_vt2%l]"/>
      <item value="11010: [nh_vt3].Label, [nh_vt3], [ten_nh_vt3%l]"/>
      <item value="11010: [nh_vt9].Label, [nh_vt9], [ten_nh_vt9%l]"/>
      <item value="110: [tl_ck].Label, [tl_ck]"/>
      <item value="110: [tien_ck].Label, [tien_ck]"/>
      <item value="11010: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="11011: [ngay_hl].Label, [ngay_hl], [ma_ck], [nhieu_dvt]"/>
      <item value="11100: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHxOaeon7NXPuk9fxBqYULPQnZ1QWg+7X4pu/+U0Us/R</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&y78Ua2DLSLK5rokICbdsClxsnqUuI/ZzsWp0In/lAgG28NvHrXrxPO2mV0mHdRQ7lI+x972kh3rVJIVCV3CGiA==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcGojQ5ADIVEBaLG64gVmGQhdkBivJJ7HHq4omPmMEuFD</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&y78Ua2DLSLK5rokICbdsClxsnqUuI/ZzsWp0In/lAgG28NvHrXrxPO2mV0mHdRQ7lI+x972kh3rVJIVCV3CGiA==</Encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcNeBv5rtWUuIsUYU+kLcM6X8j/JGKCWK++WI5AQXTjzfqbd+eXgF10nuwTmoAN835dg2B76oUQVRFzgNuXGQZOhmz/vNcgGSv7WEESfjx2Wl</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3af99XLCv10PE39uENjugvgjGlsRTUGxoPhirmhCio5g+oL+NiiXRbfrT4zEroRgNIkHibOl3ERiVHBlw5eAxDeJYjMlkx4xLUtapoulnKs1TChTtOuxc+d6pMSVVPEu7Uor5uyJoCt7VlGEXchXJygDf0NZuhcjUEJ2Wto3iD36jq2K01a9WVis1ene7EcbB37Uo6kFgCJnqSy5WT7gy8rxSMCFsJw+ONRKaC9dIK4bDQVRQA6KCcP7triN8Tlux9Oy5B8yaFq0u3jQDdvM/c+CyuJw44ub30HoT6AAYox9ja/6AELXi4paY/IQGl16IWEos8FeHUnKoeyu24kYVnyZkC8nZqnvXOEEMSqjSdFs5hti216ZNHBcsLdZPTE/eTELXlUo/25yTYuAL6IesYqgco9T8jKKDGx5zTnxUxHalf+TKFcPo+AGYlevtEW15i</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5+QRWddH3AlR+z9nDTz+7CqQkA+CAc0ekwifZZLEvnfA==</Encrypted>]]>&k1;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLZnFqvK02RF6hsYxg1Y572STthCz+ioP90wzQA4MkF5qT2LGRMIQ+Y+/INgntbWu2xAlYIhDljoZjw0wrFqy3XD7Xd3ZRC699AB4Vy4Q+wHJRX5lR/b4RVfMro9jwD9+22haMKUyLbfjAmX18q1nkSjOIJFMKNNKP48vaTH1UioncYKWg05N0uH31TIaT5MW7oXfID2++h57qYcJXPIy1yaJ9EAmS+31wfqoBJki5b6E8s94P9hx3tQCYrMNWKXnidfTaSXGc9bUu9+vzCgQxNp73lnFEk/bXwM4g3JVnngw5x8wgxTa2ZTVC28EyAZp0Q==</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp9ozwmNWaFXFGEKfmQZvzteUI1QmUgP10yHksf+Ca1iWw==</Encrypted>]]>&k2;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLZnFqvK02RF6hsYxg1Y572STthCz+ioP90wzQA4MkF5qJ6bKcEk+g0kuLI+AwLE2lBuxRdKU3YP6GL3oKH7ROyR+O+CoLxfAtJF2svtlOP7ST/0XK8YFfFAhQO/qiWQ6bw==</Encrypted>]]>&k0;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLbWKoL5jETtroDAedIqUQR42mEpHAQGseHKQPt+hO6zMVZCLu0/56nviMMRE2b0t5VXIS9FErUnVAIrYHbfYuSE=</Encrypted>]]>&k2;<![CDATA[<Encrypted>&YARH0qdfPiWP620v9FAeSPICrzWaA8H4buAdoshnAjQ=</Encrypted>]]>&k1;<![CDATA[<Encrypted>&x2vMhmcVHH3IWkEVW8yP6+iSr8HCVbXk+kp2q9xQCyqmc9YlLhmnVJ/JF8S3JxvMLcKnr0xhxty+P8Xmb8WI+mLoDA2kAvbBWuPmVLZpua1sHkUp18bvW+8XW+sChTNX</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu+sA7lQ0OUQmY6GyjOn9qqcr8ilj+alg1FB1xZVg++6PNmeNq1aGtIvz0fc/5iXYyKvRB7Ve0FsNAjHroyhtgyecmSpsHPHu8PJj+B9IHm62tcaUedRUjbmDWxfmkPgV107juZYena0WuxaxQcAUuam3CGA4BeR+1VP+7X5WN46K+Glvrw7bfI3HoNmoU7lO+uNIvihWhTWRvPb3wtGHzF4m3Ufb+rTn7VoYVOQjFzwvfyCtbjnVXNWwQqtVYHWK3STZo2aNSrp2XbGIPdnenFXMpAOMj/gQ1tdWyLMQghc4</Encrypted>]]>&k1;
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22VUV9w9u12xK2zTnLDiowxNPpOqtA+PRlgmftH2ayUoY</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&pOaJOB7c2Z2L/MPuZ3ZQj3QikAoJpXO4HtU3AdaHigJKb6vTIJVM9HVynL4of0jQuQa4mVX0cNd0t3S9dQ4cP5YKPOFQ4f06bwxDJTvZXrjG1dKCFkeLrL9Co9BR4Tud4kqmXi7eheYneEODsmGBCHZ2XH2IXjSFyA5e5K2OWHPsFqFf06b0bPgdlC9SOmYUX5FNJU9U9f/uCxc+luNZHY3u+tftaSgPeVufL54mtrU3twHoHHD9gXSv6AQTjW/gwDOOJ7ZJHZEZH1kNR7anaesihD+eETQmqaMl25LvoxOy8I+MSwiqEPRcjC0GWbcVJbsd4sUktItGGV2pgqenmolySd5GDEpHvgzjbGtlIqm5Lu2ysxZgJCKkjDN/NlYmz3C7L9uwjwZx6HhcHRp8z4yKsclDj9gRa37WMuDI4tlt6NUfBWY5j+vOJRyvecJnK9gaFT8Xth6MRHA5M24kuA==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&y78Ua2DLSLK5rokICbdsCsm4RsXPlEUtv9H4+N17SptQ1pQcD8TXkrMVVj62avc2AxPhdxmeaNSbxKeAPpBndrHLdQbeClEoQ31WG5Rsx1BwR6kiKpiZiSqrkyNhbOFRVpXaDH6s9LVFbkE3M4cmrNo5bRMBnzIuSTpZ/pB2x7sMk4OwdIAQaGoFf87Wcd6GwnUQsu9Vrk9qoCj1hOr2m14rz+zCNgCGHMoK6Gdtb7aAHSGR8aTtZUuK3lDS4Tg/</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&y78Ua2DLSLK5rokICbdsCkTLxUozjNuPulWO9HUvfX7SE0NYoZdmu06K/Mn6CI8F9DI7qKdxU66J9oZHAJg2sZuXXjo4Gc5Vme6tFKcDpaA=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&y78Ua2DLSLK5rokICbdsCqLQmlhkcguGCRIZzdS0qQFDGCV1DHVGtvFBNlcR4Gx/OH2tBGkgq1tEnPBPePRIJMMo89QdvVLTdlOJnWSULxZx1g1RHvboszQ5hn5Xm8euCT/z+6p2gT4PTKW7fpA+MXf9m5NK0IQk7I+uDp9O/SDNCwhSCWoRkKFMgS+rDp6azJAjuiTGfutTaTsFuK11XESo9TDhRBYX2KsUy+cXY7U=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&pOaJOB7c2Z2L/MPuZ3ZQj/FRAXkAOXx4WFGsrF04tLYRL/k2DmEccQJYaR2wy26L3DUEdqYE0G78LIGEhbMWB2nS51usSTab+QJvBi6B9OQ=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&pOaJOB7c2Z2L/MPuZ3ZQjxnDMrThoQFMgFBguiZviM3WKFKWMkIeUE+Y43ZVEwVCm/fBe6eTl36mDHCe03+5uor/4cdW9NokknpNeXWrJ4M=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&pOaJOB7c2Z2L/MPuZ3ZQj64ZPoM+beu1spdwzUSQBTrkUKjzHwwxf+qkgZnnw3VFNT0pvH+HmH1a3/DfgSjzEOGEn/PptoabvmwGt+Snn8c=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&pOaJOB7c2Z2L/MPuZ3ZQjy0OWyANI3+t8kT8aLYqLE480TKVtRQOVbND7qZoBO3udQI8BINY8smVDFWaOIyVWLCZkGdqgJmZxLzJwouVS6g=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&pOaJOB7c2Z2L/MPuZ3ZQj56SVo0Gge+8L+quzPHep80PL84L5fV2hm8/ky/1ShjRQEO8W4Oi2uLja/S3LGdyXOJTwTcZfoiqQGj53smWaiY=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&pOaJOB7c2Z2L/MPuZ3ZQjw93wfKXolOc7UK4L9r7+47SdXkib4KYC9T5snlN/cJ+XDlaPWYliJ7mpHt8ZUyUoYRvfix4ofuUoCUEMnmer70=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&pOaJOB7c2Z2L/MPuZ3ZQj3JwcdrYrdkBBjO8uz8BBenxw9B4sZwgB/ftpsAVWw6ICpUD/v7IaWdsinGG8XOC59V6hugxqP1O/d+PNi9JrzY=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&pOaJOB7c2Z2L/MPuZ3ZQj6A0j73PnhtXJ9rrDs7RUwEXFQZeWXIXEZVXlXeQ8ILG6wdx2ThMBQS92nkxJ+BrE1JNt4wxi6y8gyagORY6nYE=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&pOaJOB7c2Z2L/MPuZ3ZQj4W3KBBG3dfszqYS+CPAwqstEnzD5NkQl//t2J6BEArChHcBpM+eS6sdsCnCC8blHilBaL4X5pxSwzttcphex4k=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&pOaJOB7c2Z2L/MPuZ3ZQj5DXC/EwuTo5n/y94ITjHEZGlcgQId3My3BZMzuCXeaNgeUgJPxzTxtRapzlYZF4tyCO+nnn4/09LplD9oojAkk=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&pOaJOB7c2Z2L/MPuZ3ZQj3h04laL/kZ8YJE0SPoVfLmxatSjCWNbxxfb9dI/Xul59evsVwOHyRWtUhNZj1C6ywnHvteiUAH62sHdK+veJzc=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&pOaJOB7c2Z2L/MPuZ3ZQj/MlSbrnm2S8skuvhoHLbQm2q3zc2fFeNKu/TTSwJ44UQdCI3IwpGGfeQHxJsNnfcs8f9+p/bZUFiYM4Y0r9RvQ=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&pOaJOB7c2Z2L/MPuZ3ZQjw9hrcKqgoJ4wb7KgDvR+Z2ACdjnUBJTCmWR2+hRW6sJPr76lKnjpXoGhWYQBEMH6HDREN1RfKtARON4uszmF7c=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&pOaJOB7c2Z2L/MPuZ3ZQj6yayKGZStjzhpvM3dKy9f4fV9syiGyVaFbcuOH8FkOwx9gZ+lJGIvcgxM5LJ0+y4Gmu+VGlahtT0HT7MkfCNJk=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&pOaJOB7c2Z2L/MPuZ3ZQj5S5u9y+f/uVB8I61wp2MS9uOd1NCqqoFmAc0r8mix64qnzqZRrUkhXyloHhFGOgVC1faPQn1OGI8Clgo+VPMWo=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&pOaJOB7c2Z2L/MPuZ3ZQj6kz5UutuaFbxeWQkWK0dnk7AFfESGKGzP1xu/2efCuT865at4PRMRWaCFjFCJ2dDg==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&y78Ua2DLSLK5rokICbdsCuv46MDsTz140d5Q2f/mG/7wFQ5H8tj3OXef72jHTf2IeD7C3ww3l8xW+YN7CwwbdwynqStOm/mkexDWmqSZCSM=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&y78Ua2DLSLK5rokICbdsCuXVq8gA+dof/XLFG3FrYCHvKQgLB1ZlvSyhaRPTF0jFBmRWAMx2QtojfO4A7gkjSCxALnDyaxplhdecA810x5Q=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&y78Ua2DLSLK5rokICbdsCqLQmlhkcguGCRIZzdS0qQGH/zo3TDHtCNwPuTvBOVxmWZWCenMtg2gPTGYojblV//vtN5iQWI3pBOOzmOJBOlu3B5OYCfC8IXmG3UVwio2c</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&y78Ua2DLSLK5rokICbdsCiw4wRYx49CFXNs+8HBvVKKc4XKsSeoRxEoNEA+N9tlblYn1G+MXt2pdBQDvW9wINYHtSRj7BQbwqe5G8X9uMwBRGPyb9R/uGORB0MZp/DDWcgms1TZvfGrjk2u1YtUFFGU5Klj+8eJFLH0tjT9+nqTGPLG8ATyy6bEl9sJ6gkq5</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&y78Ua2DLSLK5rokICbdsCqLQmlhkcguGCRIZzdS0qQEelD//CSe9lJZn4YyEOFQVH17jRHjwF3Y2I3YL3OeGnjPH1IQBqgK5OIe4dpBphrXEz9eEcE/Ll1FE7c3gy0+zfGT0fIVFqBhMkFnqG8Taivo91YsrRPU0kC0kXA/XifRDizqEjIePVLQzwx7cYpI78hBbexHzcZeZUIRQsmKJhQ==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&y78Ua2DLSLK5rokICbdsCuv46MDsTz140d5Q2f/mG/57/if3biSiQbP0GXSF8dp2TAa9YJQPHryaZqifS7C9KFSc578R82JNeKzWzRLxs0Gkl9kPa+pATwd7xuDxEJTsHBI5PX1dczEsViequbWZiGVA4nJGjwl924wGFSkOaPtS1JsISYjLr4fk7WAV/tAl2Sg17HETm3WNzYjYpe7E441L338k9LVq79AJRKCtOE8=</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Item">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7OgXRUOS55f1qZWUcxbp07QCYNyTiLuGjsdOg0xgEQXNIu1i9vLplAyNQLu+wb4QUTjHz85T5go0iHoegrpQgsx6MBgE6nKDt9AXnIzRvH6767FKu/b2rfih1zwvVkVx0x80Qn7ohfebMTW2aoWi30BvZLBGPrmgzfQAr2sYjBQw==</Encrypted>]]>
      </text>
    </action>

  </response>
</dir>