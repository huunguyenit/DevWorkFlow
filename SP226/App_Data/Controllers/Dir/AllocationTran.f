<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY % ManagementObjectTransaction "INCLUDE">
  <!ENTITY % ManagementObject SYSTEM "..\Include\ManagementObject.ent">
  %ManagementObject;
  %ManagementObject.Name;

  
  <!ENTITY Calc "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu0nmq2EwKKYtL+xMBuJoTHHuT8csR7rJoa5dSha5SeYuVx04WGFT0Ef/zflz5Bnarcsb8lz19CBGzsMQNHO6dk72qLGUDTwA+jvrlShIKhjq64gq27k9IMWMHdfRvwRqw7JrTtwg2lcWfv7KWx1l4c0=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$7BiIvmN/gj6ARfl6W+FQ8ijJxyFITfx8EWc8ea4xICrlhF1vfKBExpIvx3bM9sAYtzn7geaeQ/MEjs6syGMs+paqRCsl/e6NvqfTjcsMhDs=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$7BiIvmN/gj6ARfl6W+FQ8lijTActIG47hr8TbaszshpaGNVxIhmJXK31VAe49Sif/gwKYxTGmLDm3z3rMo8wtRu2ND57qAblai2XbCAALs72uGURl0NbpDRN99JTkee2FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$7BiIvmN/gj6ARfl6W+FQ8mcLgaiebW/TGjnjejMclqqaqVwpKo9KYFKup049w2QvZiP9CQcutOvf1bs9Y8hFzQ==FastBusiness.Encryption.End">
  
]>

<dir table="dmpb" code="stt_rec" order="stt_rec" type="Voucher" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="bút toán phân bổ tự động" e="Allocation Transaction"></title>
  <partition table="dmpb" prime="dmpb" inquiry="" field="stt_rec" expression="''" increase="{0}" default=""/>
  <fields>
    <field name="stt_rec" type="Decimal" isPrimaryKey="true" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="stt" type="Decimal" allowNulls="false" dataFormatString="##0">
      <header v="Số thứ tự" e="Ordinal Number"></header>
      <items style="Numeric"/>
    </field>
    <field name="ten_bt" allowNulls="false">
      <header v="Tên bút toán" e="Description"></header>
      <items style="Mask"/>
    </field>
    <field name="tk" allowNulls="false">
      <header v="Tài khoản phân bổ" e="Allocation Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk_pb%l" key="status = '1'" check="1 = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk_pb%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="dmpb1" external="true" clientDefault="" rows="242" allowNulls="false" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="AllocationDetail" row="1">
        <item value="ForeignKey">
          <text v ="Decimal: stt_rec, stt_rec" e="Decimal: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="loai_pb" dataFormatString="1 ,2" clientDefault="1" align="right">
      <header v="Loại phân bổ" e="Allocation Type"></header>
      <footer v="1 - Từ tk có sang tk nợ, 2 - Từ tk nợ sang tk có" e="1 - Cr.Account to Dr.Account, 2 - Dr.Account to Cr.Account"></footer>
      <items style="Mask"/>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="-1">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>

    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="302" anchor="7">
      <item value="20, 100, 25, 5, 45, 25, 303, 25, 25, 35, 120, 25"/>
      <item value="10101------1: [stt].Label, [stt], [stt_rec], [cookie]"/>
      <item value="101000000000: [ten_bt].Label, [ten_bt]"/>
      <item value="101010000000: [loai_pb].Label, [loai_pb], [loai_pb].Description"/>
      <item value="101000100000: [tk].Label, [tk], [ten_tk_pb%l]"/>

      <item value="1: [dmpb1]"/>

      <item value="101010000: [status].Label, [status], [status].Description"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="-1" columns="20, 100, 25, 5, 45, 25, 100, 25, 25, 35, 120, 25" anchor="5">
          <header v="" e=""/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3aN/7PxwrNmja2J0eINLzr7yQXqGj/Z9MadUpxjxPIGGvCZZbf9BoF7dav+kRY88dkP/omEk8QNHSdeelDXFkq/kdPQl4K29GL7K519GSkX5HMT3gwvuxWD0dSsWrforGE7fr+v/BmaWcBNJIy/VCD7IbwNx4uv134+BV3ATWH3/BklGI6LWshDd+zl36THRwvSSucctXei+zT6+BXXyQV18FXrMVr2W4LZCctQTfLiPkLtHJmyDSjfp4AaLmpM4kFkS9tgj7tMcfqAcSMsst/znJXoLji7iv7FGLDy/5SchfvjYYZn+IxUhTPl+tsHXh6pjn8QN7dxuz7Ydjv6qa97MivlNNzGAq2E9l+g6MW3+RsLik3P2oEo5ybzolULxRaUJ4d8crom0AVHtflxHyZ0qhyZUlYEWgpwKfMYFXBzPg8iwLGpP/90Gm8AWb7GjMe+AIYpxr1I2TqsX/WMrQcq/EM1+TRwyl91ClIYKN9z4Z5b6URnX07PGwVN00yTSCm6bdYCd66BteUpcNRoBK4hSdnxbQ3dQ0b7AWeL3FztRM=</Encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcC9x+aCOYLiyGQ1FZL8GDcLWLDqyRCaKjf05PyrXGq45tVC1g33Ur3OBf2Y4w2xQib3hkYPzQgq4fvPUelgP2IFW32igL8XuKqf3pHDyvqG+Hg3v2aCT4x2B7eJEHp8qhA==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &ManagementObjectCheck;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN2JKxKAnBFch6SwKc9HgayuYbj8YcwZjqrfsqeBUDwUBUgvILv8fX2H2isRcGbpwQ7fs4xPp/IYeR2cxFbWoXe0yqMguC8KcUhLNoi8qz6LVM9t8XG80+JEn3klxea1nisp0b5/wV9p/CEPtPW5uiTPCBD7vYDTqM9PpFPZhLXKTnRqVekIq0yANpm8N0/X5Eek4LU5zI+mzJzkmRMX7OCgxQ2Cf91ZJr9SmV7Ubc2p163VNqUkFlRCAPc4aBbcTfprGgmvZDbcvhvkqaKe49rtdcr4sKaMiQUF5MLkBzMdIVpYS5Ys9hzQEWWmadSi7VNjssQN7bF27KSr6ewQ8W4cJmtvjSO+IaIhqbE+KVZTD0HGVGJjC5OgCY0CiBEtfI7HpptBH/aInO0ACFZ74cQ=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        &Calc;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu06MBj5kIn5CpfFPcXe0QpCnzlMZ7prbllZO8Gyc4dMI0VtfKm2tTXBFcM4X339ese4eBeueW3l+My2vNRtfQxLoWy4+HsyGB7w77Q94no2s7AYYfUTN30e2CRLcZD6759S1ALPVyvX4A98tZNTiQRDpI7JfIFVUSbXD6A/bDR1mnllrwiq+x5CcyeK9lZJViDpwRHYFKNJc6aHFezXoXMM=</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Vq2CYU0i7zqrzE2cPL46YqQXCSNCqQNkQGZu1XvxBibCqJe0pcNUPDL4mCbjuuC8rozNg5maI4qtUGFgS3/kRQ=</Encrypted>]]>&ManagementObjectCheck;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Zvw9vwd2qOPlT9KvKtfHMDvastDlX5PAT7x0EZzpa7YJi9QiuNZ5F4qCtK8VPTUOaRFxm0Z6f1l7ylZmyVtd17SvL3SfWIExP2CDNaMvS/gTqa7+/CLTz1tbYXymMWx72DnHU99pQ/RrfzJAtrIKKVMTD0FZS2wZXzBMxcqupeBhOlyk7+9VJL9LrM17lIoIEODQGsog/1LMngRzQXp28ba9/xfaegNqPuGXcEB5UaYAsmkIMATY9EDJYvRcXG/8leMO1PEnUc91R8pIvpk1sShG66qWP84WGsIbdE+noMVIiX4ic85uZkQeM36H1jIwadoCO7cPSxjZXuZ61of0CfJRHiiQNWPM294wQePjKHW9MstBLEdbZ/8VtCcyZUEpgmqOSwpaey+eo4p2qk4vZ0=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        &Calc;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Vq2CYU0i7zqrzE2cPL46YqQXCSNCqQNkQGZu1XvxBibSQqqrgnoeU5JrmFER71VaQJFVHMvxa3rmJhiSLSNvZGM784mmumBZEC49VrDNiyW/hp2Q5I4O//j6bzy9HpWPsKD+VkTEqaVAkWWsqQVUmXP4g0KQP0lgNEPCgwbAl4Y7ydG+ABiI1S8IzvyAMWqtwzqQLbC8wbV80Cxh1wWVfXLwCZIlCX4Yk/vvNG93pGZ2SnuVZw7D4WzAQ8FPjgzNg==</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcLgg8s9wDwEivG727KqSxyfZnAY8hd0wRsS/U/kqJ0Jb10gZBTmFGFyX/zJwrqhAtXXVqMLHUUELBD/WfgaE5CWFdnfGAIn67I4yZVAKMbMqhC4rAMx8DCkx/rNIqyrAqrUm0LB6jMfc1dWtUcqe8s/zS/qmTH6MhZeWhs1NOx0CBcpR2s7UxLiCNUQQHWeVXWR6sZKOqC3/+dh9kHKmGpzbjDT47I1U3lIIdXyn/tCDFUssPqcR3mlJmC76jfm+b9kngYOBTN4Ob+uGq4vYEHg3Cjd0Zp4WuORQN0je/UU1bd7YRiBbQexpFCdsxgN0CFJ1sQvrPWo/yX99FRcRcrKLYmCLiWFpcuTCnzZV22HLC0ay7eT5XivSrbB8INOCvg==</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22VKaBUrspbPJs/UZF6A52n624oWzAsuGYurChlRNynPHySS31/z3G1uuyxgb0hQ91JwFe3jV5/sugzjcU470HfCuGRyWz207ryF2aucJ8WQ2vJaWb5qdixHGuNKy0nCPT3OONUIXJK7N1ftOMas4wus=</Encrypted>]]>
      </text>
    </command>
  </commands>
</dir>