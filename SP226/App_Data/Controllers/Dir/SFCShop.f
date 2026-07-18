<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY Controller "Shop">
]>

<dir table="sfdmxuong" code="ma_px" order="ma_px" xmlns="urn:schemas-fast-com:data-dir">
  <title v="phân xưởng" e="Shop"></title>
  <fields>
    <field name="ma_px" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã phân xưởng" e="Shop Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_px" allowNulls="false">
      <header v="Tên phân xưởng" e="Description"></header>
    </field>
    <field name="ten_px2">
      <header v="Tên khác" e="Other Name"></header>
    </field>

    <field name="ma_kho" allowNulls="false">
      <header v="Kho" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1=1" information="ma_kho$dmkho.ten_kho%l"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330"/>
      <item value="110: [ma_px].Label, [ma_px]"/>
      <item value="1100: [ten_px].Label, [ten_px]"/>
      <item value="1100: [ten_px2].Label, [ten_px2]"/>
      <item value="1101: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPS6o0FO4oa0V8ggf7RVJkjpvu5lLetaENfYXcCme6Jq</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l16dCzkPCkdKPBNy4yMInqhFbmGwKKj7TWl9MVMGdvkN3lhjYoeyS5Lm5OCloznxTnQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcCLjOzEBOw7WLxwsZmNVIhdyKUhv/DDvGaGbpwHJkbqg</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l16dCzkPCkdKPBNy4yMInqhFbmGwKKj7TWl9MVMGdvkN3lhjYoeyS5Lm5OCloznxTnQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3aN/7PxwrNmja2J0eINLzr7zUf/9ZOjtpNZZoZqBHdQ4eiSJFZt8UQO0xuhv1ekTUzXIULZSAnsqnPlpdgAH9eHSZT9SOL+vKYHHaiaMNTf0MYQhSPiil22H1D7NB/D1PABDUuRy0j5kvL12nZtYOsyItWEdB2h6H4ScSJwb30/yJ4bnTGkNlX5cAhfqUUSfk9yca+yG0OVLmbBAdU7+FpyNFDZkp8I+xamWyK0WDB/YxChrabJoyzjUYFB7NkCwvmwNGZ+dY/fCP3wzumVPtC/mZbv4Hv4ie4WCknuevvivglNcL6qQs/xh6eukN5NNcdwcw/oNGzCurVEiRrEhOYMam065In09NLyZXjNUebAgVNAHVyMdFZ8mSDRZyZHOysQ0YRH6gSMrBmepsAP0zlZ0FDCkmknOYwlUlvN0DtuMwWix6v7d1Q1VyEtgfgEW0mvdf9dAnDyDQU3jwp3Sv/el4XMizBkoM9DlJpBXZNmEXSB+KbfuM5JbC02KTA8o//2Im5wxMZREVQJfSIBBiAzg==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5+QRWddH3AlR+z9nDTz+7CJwXd5fSPmaLeW6qpLZboBfB21aGfvilW2vEn9Z2zoOO4JU3C4+kW6MGmzCAYWq48y1AAZZLZt9aB/CXs9LO2nC7Nzye7TUb/RL+eX6bAo8h0v0vofpq1MkrUbK+E9/eVR3tewDU3srQFaZA2HLb0hO8FlcjUjsa5vfKyGL0SVAvzVogixi7ASYe4Fcp/IIs2IFLJfNjr2o7sLLsiovbkzw==</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp9ozwmNWaFXFGEKfmQZvzteiTPaWga6bqTdx8FGpsOvFBAB41ZkGC/QTB81jHDrceOn2Xl8IDn6N8dp2mYcB+I7HQyAxtUuagIsLRhlaUwWnUG1k2fZqkBGdghGcwQVr9TPbD3WzR1UIJNs+j34/pW2OotAYx0ohZbigdvk41A0rE+8B47V1XJaKhvMxPp/s/UPqn4765HPVqjsHQ2S2mA6ZKaZosbjXjWi8sZ6lzyqW2quGQxv6P9Q9k1Ytwb1K3Lp+oAKevbHDpyN07K+165ihPUEF568R9SVm24Dxvbh9D5lZngDwBiIXJKhalmM6kCTWipJJ9f49FR3+8rNtM332Td19H7ZScAoXE2rI9UpRHlDwh12j5/Tpw5SfES1HcRjKWhHpXnw/psrGhcVgB3WMJTxy42ODzJszMHVAUkGzeN7CkGSmMIvrI6CbJe21YHD7Q7yD7jrYFWApcVMAkTX3CVCq/2V3i4C1H3RUY9tuiJvEvmB2KgNkqu1QTYa2qEsPTbdS+5jJApNwtUPPGBYc+Nowq9sFE51aOzuWcbutQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV5FMFnjXOQZtSPNyI3ZJ+uj/0PJbpbWQA+VtEZASago1</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4/B5vSrz4CX//Go8grYVJXpeDloYsvqCf5ZfyjMoDGDiTpHkkPuBRB0dmjaXyqIfUH0d+TyMO3QyvE6eMSghTST8EwL7YFShCCAWkxeTh2oCmlXFce2Axk4sBDBJ6ibzWam5flh+2dt0iDIL6bmbN+VF67WT/VQWLayhm70s7/SnSpOSRqZsP3BSJEL9PQqgoV/kw8qZsYRM+zuRcU4RDKcJXD07OW12ff49X68S28SQHQcf+YPhXHQdNrU3gCBO6Q264Vsle3Bc1DbnVquu9FRX7ZVf+0agaGd/lyuBlAGNS9vqmjlISTMYIUqz+dxNOPKrtk7k63mZwvNISGSuA8a6rrqawLBZUhpDjfvq/AvehD8FkuSC3l2MMnUMpc+jZGeJc5EfTkUcnVctgKCqAA=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22SAyB0lrLIl8l+LB5Gl9ES8J7BXWwS26JYkGY8fKh3Vm</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l1+QE5+824HsdlLYDaZfqrNdg22zIeL2+lacyL0eUcOyjx5pBOeNdIdiqW/GW2NhyUg==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHVIL7HkouhE65bfnddYX6NC4wMtci2ihWiawi4sQTqKpGpo/R7/xgC7rnOpb3BiGKA==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l1zmcirVXzLesCZci/PpW2Wm4ojpV3CJiN+mVYQO2L2MTUQLpZp0sgq7UqjxftOviFQ==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHemLmDblVZZyuvFaGPTzKq8K9wbgN5j3pldI02fUnyOHaK0TE68QSiaetR9bD3P4OuTLH4QGCzSeRvTBiBDmV68=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHc7X/84zX1ElDBQ0Oio9BYhpU71ALmfk5ffMVXbbEaC95FDNPuPVyyo0paJ5AWSXOQ/onvbV5bNXYdtHuIDX7H8jFKJNFaPszc306jhi5p99HS1Qv0eP8NdyIUbO1I6wkydyR8XStyMnqOjVK+LvzAqiPdge+2gteJgnKePIWc8FawdvoTDX7o6DDegp1bXaVwhchROXxfkUtM87zWtZkumU6ZbXUYYfY6qJrSA+X5yBrWbEhBg4kPWMdLCZ2D2SaA==</Encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>