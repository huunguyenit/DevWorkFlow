<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "SalesPrice">

  <!ENTITY k0 "@ma_vt = $ma_vt.OldValue and @ma_nt = $ma_nt.OldValue and @ngay_ban = $ngay_ban.OldValue and @loai_gia = $loai_gia.OldValue and @ma_kho = $ma_kho.OldValue and @ma_kh = $ma_kh.OldValue and @nh_kh1 = $nh_kh1.OldValue and @nh_kh2 = $nh_kh2.OldValue and @nh_kh3 = $nh_kh3.OldValue and @nh_kh9 = $nh_kh9.OldValue">
  <!ENTITY k1 "ma_vt = @ma_vt and ma_nt = @ma_nt and ngay_ban = @ngay_ban and loai_gia = @loai_gia and ma_kho = @ma_kho and ma_kh = @ma_kh and nh_kh1 = @nh_kh1 and nh_kh2 = @nh_kh2 and nh_kh3 = @nh_kh3 and nh_kh9 = @nh_kh9">
  <!ENTITY k2 "ma_vt = $ma_vt.OldValue and loai_gia = $loai_gia.OldValue and ma_nt = $ma_nt.OldValue and ngay_ban = $ngay_ban.OldValue and ma_kho = $ma_kho.OldValue and ma_kh = $ma_kh.OldValue and nh_kh1 = $nh_kh1.OldValue and nh_kh2 = $nh_kh2.OldValue and nh_kh3 = $nh_kh3.OldValue and nh_kh9 = $nh_kh9.OldValue">

  <!ENTITY FieldsList "ma_vt, ma_nt, ngay_ban, loai_gia, ma_kho, ma_kh, nh_kh1, nh_kh2, nh_kh3, nh_kh9">
]>

<dir table="dmgia2" code="&FieldsList;" order="&FieldsList;" xmlns="urn:schemas-fast-com:data-dir">
  <title v="giá bán" e="Sales Price"></title>
  <fields>
    <field name="loai_gia" isPrimaryKey="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vt" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã hàng" e="Item Code"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PDvdTvJOEgRcT99dbkFNK7EOXWzm++jrRim2d/a5RnX</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&y78Ua2DLSLK5rokICbdsCuUzsTHTuG4BL8xxOEj3W+4gljLvbDWCk7JwtIUHV0Zv</Encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''" >
      <header v="" e=""></header>
    </field>
    <field name="dvt" inactivate="true" filterSource="Optional">
      <header v="Đvt" e="UOM"></header>
      <items style="AutoComplete" controller="UOMItem" reference="ten_dvt%l" key="ma_vt = '*' or ma_vt = '{$%c[ma_vt]}'" check="ma_vt = '*' or ma_vt = '{$%c[ma_vt]}' or exists(select 1 from dmvt where ma_vt = '{$%c[ma_vt]}')" information="dvt$vdmvtqddvt.ten_dvt%l" normal="true"/>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true" defaultValue="''" hidden="true">
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

    <field name="ngay_ban" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Ngày bắt đầu hiệu lực" e="Effective Date "></header>
    </field>
    <field name="ma_nt" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Loại tiền tệ" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" normal="true" key="status = '1'" check="1 = 1" information="ma_nt$dmnt.ten_nt%l"/>
    </field>
    <field name="ten_nt%l" readOnly="true" external="true" defaultValue="''" >
      <header v="" e=""></header>
    </field>
    <field name="gia_nt2" type ="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat" align="right" >
      <header v="Giá bán" e="Sales Price"></header>
      <items style="Numeric"/>
    </field>

    <field name="nhieu_dvt" type="Boolean" readOnly="true" external="true" defaultValue="cast(0 as bit)" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330, 0"/>
      <item value="111: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="111: [dvt].Label, [dvt], [ten_dvt%l]"/>
      <item value="111: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="111: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="111: [nh_kh1].Label, [nh_kh1], [ten_nh_kh1%l]"/>
      <item value="111: [nh_kh2].Label, [nh_kh2], [ten_nh_kh2%l]"/>
      <item value="111: [nh_kh3].Label, [nh_kh3], [ten_nh_kh3%l]"/>
      <item value="111: [nh_kh9].Label, [nh_kh9], [ten_nh_kh9%l]"/>
      <item value="111: [ngay_ban].Label, [ngay_ban], [loai_gia]"/>
      <item value="1111: [ma_nt].Label, [ma_nt], [ten_nt%l], [nhieu_dvt]"/>
      <item value="11: [gia_nt2].Label, [gia_nt2]"/>
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

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3af99XLCv10PE39uENjugvgjGlsRTUGxoPhirmhCio5g+oL+NiiXRbfrT4zEroRgNIkHibOl3ERiVHBlw5eAxDeJYjMlkx4xLUtapoulnKs1RQmLWkmxCewrm9Q5s/xqWe82a1bISqmP5UIiI+5IAXm4Y+C2/yHCa7wFjjTRmV4S4GKn0hYkT9NIa+BycUfBfq+rOa6wYdXBSz/zFNBL1iMBhFlb/ZCq22tQfamH2kBApCu/EHcNIbu7idIVIQATpz9WgOD6tNL3Iu0MbpweBMd3Z70/9v/jDQudT/tF/rmgHoApous55EJUtFQ3hBd1GawvZK6lYoeVAB5dVGfU6n1UbGsmq7TN6PWbOq9ZGRrdWvDxIL9aNY7Y0jnXqzDffAhGqQnXQ9dKwwIS95h3/cqO/ecHcp9jCBz+DuEi2ZX1s=</Encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcNeBv5rtWUuIsUYU+kLcM6X8j/JGKCWK++WI5AQXTjzfqbd+eXgF10nuwTmoAN835dg2B76oUQVRFzgNuXGQZOhmz/vNcgGSv7WEESfjx2Wl</Encrypted>]]>
      </text>
    </command>


    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5+QRWddH3AlR+z9nDTz+7CqQkA+CAc0ekwifZZLEvnfA==</Encrypted>]]>&k1;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLZnFqvK02RF6hsYxg1Y572S4uz0HBlC4ZUOgm0p7k8NxasSFHINr3Yi92OjLi/tv2qp90Y0k1D3AsJF2m0vHrlrbBwyE0krioO+xhVm57s6TeLrcAmVK0Ap5zTopBWC8etHcSZVAxTRzZ6mQooM6zYggkGHkxOfLN0MpSO3Kt0Yg0/dTEzXbuAZfi1RLFyUDao4NQhw+Dfb7ZeW8aEycjVPrzRlP4qjKrXZJHYKKmbYvc8OuOx1pFjB839Ely67ww8fdLd+bEvv5NW2knMhoFDbky8fxFad432t2odGrEfMml4F0BLmrE+uhEhgv2CF4dQr8DiGnBmy/+vkp1n8BGJtFhWSqfgZKtyXL5fxAa/FLDiFE8v3dTSxegYi/x00H7Q==</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp9ozwmNWaFXFGEKfmQZvzteUI1QmUgP10yHksf+Ca1iWw==</Encrypted>]]>&k2;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLZnFqvK02RF6hsYxg1Y572S4uz0HBlC4ZUOgm0p7k8NxAzj1F6tl3x5aukJKf9F3YWsadFvwIxNJAQfqhClEUd3XV9ipPXjLnhGVhKZWmkbo/VFr7s8F020U6q0d7nq0sg==</Encrypted>]]>&k0;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLbWKoL5jETtroDAedIqUQR42mEpHAQGseHKQPt+hO6zMVZCLu0/56nviMMRE2b0t5VXIS9FErUnVAIrYHbfYuSE=</Encrypted>]]>&k2;<![CDATA[<Encrypted>&YARH0qdfPiWP620v9FAeSPICrzWaA8H4buAdoshnAjQ=</Encrypted>]]>&k1;<![CDATA[<Encrypted>&x2vMhmcVHH3IWkEVW8yP6+iSr8HCVbXk+kp2q9xQCyqzHqL34K8y7M7wGBTeXw9G9SlaSD3ZH7KIFkIRJaB9rZHHLn4FJOJQ++hUJZsJdAKUQzgWmtwjELPmtBWQiQ7A</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu+sA7lQ0OUQmY6GyjOn9qqcr8ilj+alg1FB1xZVg++6PNmeNq1aGtIvz0fc/5iXYyKvRB7Ve0FsNAjHroyhtgyecmSpsHPHu8PJj+B9IHm62tcaUedRUjbmDWxfmkPgV107juZYena0WuxaxQcAUuam3CGA4BeR+1VP+7X5WN46K+Glvrw7bfI3HoNmoU7lO+uNIvihWhTWRvPb3wtGHzF7m/8/rEQnI5CjupF8nz1MiBGPmCjjlwvjvp6/wiPDDZqXPdoV7wvO/Vk39OyPFzxLvr7H9MxWb3FOYXklZtcxUdZNCL6iwhykDZs8G7Ekli3pTZodqpI15xCMIy3xDYFjy6llkbqXeF3zsfclVECsX</Encrypted>]]>&k1;
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22VUV9w9u12xK2zTnLDiowxNPpOqtA+PRlgmftH2ayUoY</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&pOaJOB7c2Z2L/MPuZ3ZQj3QikAoJpXO4HtU3AdaHigJKb6vTIJVM9HVynL4of0jQuQa4mVX0cNd0t3S9dQ4cP5YKPOFQ4f06bwxDJTvZXrjG1dKCFkeLrL9Co9BR4Tud4kqmXi7eheYneEODsmGBCHZ2XH2IXjSFyA5e5K2OWHPsFqFf06b0bPgdlC9SOmYUX5FNJU9U9f/uCxc+luNZHY3u+tftaSgPeVufL54mtrU3twHoHHD9gXSv6AQTjW/gwDOOJ7ZJHZEZH1kNR7anaesihD+eETQmqaMl25LvoxOy8I+MSwiqEPRcjC0GWbcVJbsd4sUktItGGV2pgqenmiZXtnDNoZ/ItB9f7mWqo2r4Zh6tme2PN1dYXuIRNB7gbTZPBdePG/D8PsNiDWI4nisOtMbh6sXVtXB6eJ8P7W4=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&y78Ua2DLSLK5rokICbdsCsm4RsXPlEUtv9H4+N17SptQ1pQcD8TXkrMVVj62avc2AxPhdxmeaNSbxKeAPpBndoMkW0o2lqIykl8Nn1uEPsw0eVWwkn987ddjH2UMbPuDiETnxXrHBG4LdBVrlXW7B98q8/Sb1ac3gSZboU7ENluluIe2BzELR5+JaEQvAqvoz8i9BRkcBMY8398KlqcAIxesIkbEfhfWtzgfZe/zCudfc5TpVT3e8KxKN7r8LUQLz/jbUeuDxraGf1kAm3qXCvhiIXOfpAxM6Ac19bOC3NU=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&y78Ua2DLSLK5rokICbdsCkTLxUozjNuPulWO9HUvfX7SE0NYoZdmu06K/Mn6CI8F9DI7qKdxU66J9oZHAJg2sZuXXjo4Gc5Vme6tFKcDpaA=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&y78Ua2DLSLK5rokICbdsCqLQmlhkcguGCRIZzdS0qQFDGCV1DHVGtvFBNlcR4Gx/Xi/SlYK12TlCfvuYXT9dPxT8ZgwIugq1ftO+x78yIVT5Wss7Lo+OBqt6ZRqF22X4LPo5NtGdNlO6y1WJ7i7yEvQoXq1Bo8AdbK238te9yj2a2hoQP2JYBhLpEJHYkqGp</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&pOaJOB7c2Z2L/MPuZ3ZQj/FRAXkAOXx4WFGsrF04tLYRL/k2DmEccQJYaR2wy26L3DUEdqYE0G78LIGEhbMWB2nS51usSTab+QJvBi6B9OQ=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&pOaJOB7c2Z2L/MPuZ3ZQjxnDMrThoQFMgFBguiZviM3WKFKWMkIeUE+Y43ZVEwVCm/fBe6eTl36mDHCe03+5uor/4cdW9NokknpNeXWrJ4M=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&pOaJOB7c2Z2L/MPuZ3ZQj64ZPoM+beu1spdwzUSQBTrkUKjzHwwxf+qkgZnnw3VFNT0pvH+HmH1a3/DfgSjzEOGEn/PptoabvmwGt+Snn8c=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&pOaJOB7c2Z2L/MPuZ3ZQjy0OWyANI3+t8kT8aLYqLE480TKVtRQOVbND7qZoBO3udQI8BINY8smVDFWaOIyVWLCZkGdqgJmZxLzJwouVS6g=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&pOaJOB7c2Z2L/MPuZ3ZQj56SVo0Gge+8L+quzPHep80PL84L5fV2hm8/ky/1ShjRQEO8W4Oi2uLja/S3LGdyXOJTwTcZfoiqQGj53smWaiY=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&pOaJOB7c2Z2L/MPuZ3ZQjw93wfKXolOc7UK4L9r7+47SdXkib4KYC9T5snlN/cJ+KFra91sBl3RkZw9BYAtrtrEaT28YiDjQ53axVYK0isw=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&y78Ua2DLSLK5rokICbdsCuv46MDsTz140d5Q2f/mG/7wFQ5H8tj3OXef72jHTf2IeD7C3ww3l8xW+YN7CwwbdwynqStOm/mkexDWmqSZCSM=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&y78Ua2DLSLK5rokICbdsCuXVq8gA+dof/XLFG3FrYCHvKQgLB1ZlvSyhaRPTF0jFBmRWAMx2QtojfO4A7gkjSCxALnDyaxplhdecA810x5Q=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&y78Ua2DLSLK5rokICbdsCqLQmlhkcguGCRIZzdS0qQGH/zo3TDHtCNwPuTvBOVxmWZWCenMtg2gPTGYojblV//vtN5iQWI3pBOOzmOJBOlu3B5OYCfC8IXmG3UVwio2c</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&y78Ua2DLSLK5rokICbdsCiw4wRYx49CFXNs+8HBvVKKc4XKsSeoRxEoNEA+N9tlblYn1G+MXt2pdBQDvW9wINYHtSRj7BQbwqe5G8X9uMwBRGPyb9R/uGORB0MZp/DDWcgms1TZvfGrjk2u1YtUFFGU5Klj+8eJFLH0tjT9+nqTGPLG8ATyy6bEl9sJ6gkq5</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&y78Ua2DLSLK5rokICbdsCqLQmlhkcguGCRIZzdS0qQEelD//CSe9lJZn4YyEOFQVH17jRHjwF3Y2I3YL3OeGnjPH1IQBqgK5OIe4dpBphrXEz9eEcE/Ll1FE7c3gy0+zfGT0fIVFqBhMkFnqG8Taivo91YsrRPU0kC0kXA/XifRDizqEjIePVLQzwx7cYpI78hBbexHzcZeZUIRQsmKJhQ==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&y78Ua2DLSLK5rokICbdsCuv46MDsTz140d5Q2f/mG/57/if3biSiQbP0GXSF8dp2TAa9YJQPHryaZqifS7C9KFSc578R82JNeKzWzRLxs0Gkl9kPa+pATwd7xuDxEJTsHBI5PX1dczEsViequbWZiGVA4nJGjwl924wGFSkOaPtS1JsISYjLr4fk7WAV/tAl2Sg17HETm3WNzYjYpe7E441L338k9LVq79AJRKCtOE8=</Encrypted>]]>
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